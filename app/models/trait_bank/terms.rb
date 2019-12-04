class TraitBank
  class Terms
    class << self
      delegate :connection, to: TraitBank
      delegate :limit_and_skip_clause, to: TraitBank
      delegate :query, to: TraitBank

      CACHE_EXPIRATION_TIME = 1.day

      def count(options = {})
        hidden = options[:include_hidden]
        key = "trait_bank/terms_count"
        key << "/include_hidden" if hidden
        Rails.cache.fetch(key, expires_in: CACHE_EXPIRATION_TIME) do
          res = query(
            "MATCH (term:Term#{hidden ? '' : ' { is_hidden_from_glossary: false }'}) "\
            "WITH count(distinct(term.uri)) AS count "\
            "RETURN count"
          )
          res && res["data"] ? res["data"].first.first : false
        end
      end

      def full_glossary(page = 1, per_page = nil, options = {})
        options ||= {} # callers may pass nil, bypassing the default
        page ||= 1
        per_page ||= Rails.configuration.data_glossary_page_size
        hidden = options[:include_hidden]
        key = "trait_bank/full_glossary/#{page}"
        key << "/include_hidden" if hidden
        Rails.cache.fetch(key, expires_in: CACHE_EXPIRATION_TIME) do
          query_string = "MATCH (term:Term#{hidden ? '' : ' { is_hidden_from_glossary: false }'}) "\
            "RETURN DISTINCT(term) ORDER BY LOWER(term.name), LOWER(term.uri)"
          query_string << limit_and_skip_clause(page, per_page)
          result = query(query_string)
          result["data"] ? result["data"].map {|term| term.first["data"].symbolize_keys} : false
        end
      end

      def sub_glossary(type, page = 1, per_page = nil, options = {})
        count = options[:count]
        qterm = options[:qterm]
        page ||= 1
        per_page ||= Rails.configuration.data_glossary_page_size
        key = "trait_bank/#{type}_glossary/"\
          "#{count ? :count : "#{page}/#{per}"}/#{qterm ? qterm : :full}"
        Rails.logger.info("KK TraitBank key: #{key}")
        Rails.cache.fetch(key, expires_in: CACHE_EXPIRATION_TIME) do
          query_string = "MATCH (term:Term"
          query_string << " { is_hidden_from_glossary: false }" unless qterm
          query_string << ")<-[:#{type}]-(n) "
          query_string << "WHERE LOWER(term.name) CONTAINS \"#{qterm.gsub(/"/, '').downcase}\" " if qterm
          if count
            query_string << "WITH COUNT(DISTINCT(term.uri)) AS count RETURN count"
          else
            query_string << "RETURN DISTINCT(term) ORDER BY LOWER(term.name), LOWER(term.uri)"
            query_string << limit_and_skip_clause(page, per_page)
          end
          result = query(query_string)
          if result["data"]
            if count
              result["data"].first.first
            else
              all_results = result["data"].map {|term| term.first["data"].symbolize_keys}
              all_results.map! {|result_hash| {name: result_hash[:name], uri: result_hash[:uri]}} if qterm
              all_results
            end
          else
            false
          end
        end
      end

      def predicate_glossary(page = nil, per_page = nil, qterm = nil)
        sub_glossary("predicate", page, per_page, qterm: qterm)
      end

      def name_for_pred_uri(uri)
        key = "trait_bank/predicate_uris_to_names"
        map = Rails.cache.fetch(key, expires_in: CACHE_EXPIRATION_TIME) do
          predicate_glossary.map {|item| [item[:uri], item[:name]]}.to_h
        end
        map[uri]
      end

      def name_for_obj_uri(uri)
        key = "trait_bank/object_uris_to_names"
        map = Rails.cache.fetch(key, expires_in: CACHE_EXPIRATION_TIME) do
          object_term_glossary.map {|item| [item[:uri], item[:name]]}.to_h
        end
        map[uri]
      end

      def name_for_units_uri(uri)
        key = "trait_bank/units_uris_to_names"
        map = Rails.cache.fetch(key, expires_in: CACHE_EXPIRATION_TIME) do
          units_glossary.map {|item| [item[:uri], item[:name]]}.to_h
        end
        map[uri]
      end

      def object_term_glossary(page = nil, per_page = nil, qterm = nil)
        sub_glossary("object_term", page, per_page, qterm: qterm)
      end

      def units_glossary(page = nil, per_page = nil, qterm = nil)
        sub_glossary("units_term", page, per_page, qterm: qterm)
      end

      def predicate_glossary_count
        sub_glossary("predicate", nil, nil, count: true)
      end

      def object_term_glossary_count
        sub_glossary("object_term", nil, nil, count: true)
      end

      def units_glossary_count
        sub_glossary("units_term", nil, nil, count: true)
      end

      # NOTE: I removed the units from this query after ea27411f8110b74 (q.v.)
      def page_glossary(page_id)
        query_string = "MATCH (page:Page { page_id: #{page_id} })-[:trait]->(trait:Trait) "\
          "MATCH (trait:Trait)-[:predicate]->(predicate:Term) "\
          "OPTIONAL MATCH (trait)-[:object_term]->(object_term:Term) "\
          "RETURN predicate, object_term"
        result = query(query_string)
        uris = {}
        result["data"].each do |row|
          row.each do |column|
            uris[column["data"]["uri"]] ||= column["data"].symbolize_keys if
              column && column["data"] && column["data"]["uri"]
          end
        end
        uris
      end

      def obj_terms_for_pred(pred_uri, qterm = nil)
        key = "trait_bank/obj_terms_for_pred/#{pred_uri}"
        Rails.cache.fetch(key, expires_in: CACHE_EXPIRATION_TIME) do
          query_string = "MATCH (predicate:Term { uri: \"#{pred_uri}\" })<-[:predicate|:parent_term*0..#{CHILD_TERM_DEPTH}]-"\
            "(trait:Trait)"\
            "-[:object_term|parent_term*0..#{CHILD_TERM_DEPTH}]->(object:Term) "
          query_string << "WHERE LOWER(object.name) CONTAINS \"#{qterm.gsub(/"/, '').downcase}\" " if qterm
          query_string <<  "RETURN DISTINCT(object) "\
            "ORDER BY LOWER(object.name), LOWER(object.uri)"

          result = query(query_string)
          result["data"] ? result["data"].map {|term| term.first["data"].symbolize_keys} : []
        end
      end

      # TODO: DRY up this and the above method
      def units_for_pred(pred_uri)
        key = "trait_bank/normal_unit_for_pred/#{pred_uri}"

        Rails.cache.fetch(key, expires_in: CACHE_EXPIRATION_TIME) do
          query_string = "MATCH (predicate:Term { uri: \"#{pred_uri}\" })<-[:predicate|:parent_term*0..#{CHILD_TERM_DEPTH}]-"\
            "(trait:Trait)"\
            "-[:units_term]->(units_term:Term) "\
            "OPTIONAL MATCH (trait)-[:normal_units_term]->(normal_units_term:Term) "\
            "RETURN units_term.name, units_term.uri, normal_units_term.name, normal_units_term.uri "\
            "LIMIT 1"
          results = query(query_string)

          result = results["data"]&.first || nil
          result = {
            units_name: result[0],
            units_uri: result[1],
            normal_units_name: result[2],
            normal_units_uri: result[3]
          } if result
          result
        end
      end
    end
  end
end

