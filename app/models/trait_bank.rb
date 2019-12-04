# Abstraction between our traits and the implementation of their storage. ATM, we
# use neo4j.
#
# Please keep this schema summary comment in sync with the main
# schema documentation file found in the doc/ directory, and reflect
# and schema changes in the main documentation file.
#
# NOTE: in its current state, this is NOT done! Neography uses a plain hash to
# store objects, and ultimately we're going to want our own models to represent
# things. But in these early testing stages, this is adequate. Since this is not
# its final form, there are no specs yet. ...We need to feel out how we want
# this to work, first.
class TraitBank
  # NOTE: should associated pages (below, stored as object_page_id) actually
  # have an association, since we have Pages? ...Yes, but only if that's
  # something we're going to query... and I don't think we do! So all the info
  # is reall in the MySQL DB and thus just the ID is enough.

  # The Labels, and their expected relationships { and (*required) properties }:

  # * Resource: { *resource_id }
  # * Page: ancestor(Page)[NOTE: unused as of Nov2017], parent(Page), trait(Trait) { *page_id }
  # * Trait: *predicate(Term), *supplier(Resource), metadata(MetaData), object_term(Term), units_term(Term),
  #          normal_units_term(Term), sex_term(Term), lifestage_term(Term), statistical_method_term(Term),
  #     { *eol_pk, *resource_pk, *scientific_name, source, measurement, object_page_id, literal, normal_measurement }
  # * MetaData: *predicate(Term), object_term(Term), units_term(Term)
  #     { *eol_pk, measurement, literal }
  # * Term: parent_term(Term) { *uri, *name, *section_ids(csv), definition, comment,
  #     attribution, is_hidden_from_overview, is_hidden_from_glossary, position,
  #     type }

  # NOTE: the "type" for Term is one of "measurement", "association", "value",
  #   or "metadata" ... at the time of this writing.

  CHILD_TERM_DEPTH = 4

  class << self

    def connection
      @connection ||= Neography::Rest.new('http://localhost:7474') 
    end

    def ping
      begin
        connection.list_indexes
      rescue Excon::Error::Socket => e
        return false
      end
      true
    end

    def query(query_string, params = nil)
      start = Time.now
      results = nil
      query_string.sub(/\A\s+/, "")
      begin
        results = connection.execute_query(query_string, params)
        stop = Time.now
      rescue Excon::Error::Socket => e
        Rails.logger.error("Connection refused on query: #{q}")
        sleep(0.1)
        connection.execute_query(query_string)
      rescue Excon::Error::Timeout => e
        Rails.logger.error("Timed out on query: #{query_string}")
        sleep(1)
        connection.execute_query(query_string, params)
      ensure
        query_string.gsub!(/ +([A-Z ]+)/, "\n\\1") if query_string.size > 80 && q !~ /\n/
        Rails.logger.warn(">>TB TraitBank (#{stop ? stop - start : "F"}):\n#{query_string}")
      end
      results
    end

    def quote(string)
      return string if string.is_a?(Numeric) || string =~ /\A[-+]?[0-9,]*\.?[0-9]+\Z/
      %Q{"#{string.gsub(/"/, "\\\"")}"}
    end

    def count
      result = query("MATCH (trait:Trait)<-[:trait]-(page:Page) WITH count(trait) as count RETURN count")
      result["data"] ? res["data"].first.first : false
    end

    def count_by_resource(id)
      result = query(
        "MATCH (:Resource { resource_id: #{id} })<-[:supplier]-(trait:Trait)<-[:trait]-(page:Page) "\
        "WITH count(trait) as count "\
        "RETURN count")
      result["data"] ? result["data"].first.first : false
    end

    def count_by_resource_and_page(resource_id, page_id)
      result = query(
        "MATCH (:Resource { resource_id: #{resource_id} })<-[:supplier]-(trait:Trait)<-[:trait]-(page:Page {page_id: #{page_id}}) "\
        "WITH count(trait) as count "\
        "RETURN count")
      result["data"] ? result["data"].first.first : false
    end

    def count_by_page(page_id)
      result = query(
        "MATCH (trait:Trait)<-[:trait]-(page:Page { page_id: #{page_id} }) "\
        "WITH count(trait) as count "\
        "RETURN count")
      result["data"] ? result["data"].first.first : false
    end

    def predicate_count
      Rails.cache.fetch("trait_bank/predicate_count", expires_in: 1.day) do
        result = query(
          "MATCH (trait:Trait)-[:predicate]->(term:Term) "\
          "WITH count(distinct(term.uri)) AS count "\
          "RETURN count")
        result["data"] ? result["data"].first.first : false
      end
    end

    def get_terms_from_api
      query_string = "match(t:Term) return t"
      result = query(query_string)
      result["data"].empty? ? false : result["data"]
    end

    def terms(page = 1, per_page = 50)
      query_string = "MATCH (term:Term) RETURN term ORDER BY LOWER(term.name), LOWER(term.uri)"
      query_string << limit_and_skip_clause(page, per_page)
      result = query(query_string)
      result["data"] ? result["data"].map {|terms| terms.first["data"]} : false
    end

    def limit_and_skip_clause(page = 1, per_page = 50)
      # I don't know why the default values don't work, but:
      page ||= 1
      per_page ||= 50
      skip = (page.to_i - 1) * per_page.to_i
      add = " LIMIT #{per_page}"
      add = " SKIP #{skip}#{add}" if skip > 0
      add
    end

    # TODO: add association to the sort... normal_measurement comes after literal, so it will be ignored
    def order_clause_array(options)
      options[:sort] ||= ""
      options[:sort_dir] ||= ""
      sorts =
        if options[:by]
          options[:by]
        elsif options[:object_term]
          [] # You already have a SINGLE term. Don't sort it.
        elsif options[:sort].downcase == "measurement"
          ["trait.normal_measurement"]
        else
          # TODO: this is not good. multiple types of values will not
          # "interweave", and the only way to change that is to store a
          # "normal_value" value for all different "stringy" types (literals,
          # object terms, and object page names). ...This is a resonable approach,
          # though it will require more work to keep "up to date" (e.g.: if the
          # name of an object term changes, all associated traits will have to
          # change).
          ["LOWER(predicate.name)", "LOWER(info_term.name)", "trait.normal_measurement", "LOWER(trait.literal)"]
        end
      # NOTE: "ties" for traits are resolved by species name.
      sorts << "page.name" unless options[:by]
      if options[:sort_dir].downcase == "desc"
        sorts.map! {|sort| "#{sort} DESC"}
      end
      sorts
    end

    def order_clause(options)
      %Q{ ORDER BY #{order_clause_array(options).join(", ")}}
    end

    def trait_exists?(resource_id, eol_pk)
      raise "NO resource ID!" if resource_id.blank?
      raise "NO resource eol_PK!" if eol_pk.blank?
      params = {eol_pk: eol_pk, resource_id: resource_id}

      result = query("MATCH (trait:Trait {eol_pk: {eol_pk}})-[:supplier]->(res:Resource {resource_id: {resource_id}}) RETURN trait", params)
      result["data"] ? result["data"].first : false
    end

    def by_trait(input, page = 1, per_page = 200)
      id = input.is_a?(Hash) ? input[:id] : input # Handle both raw IDs *and* actual trait hashes.
      query_string = "MATCH (page:Page)"\
          "-[:trait]->(trait:Trait { eol_pk: '#{id}' })"\
          "-[:supplier]->(resource:Resource) "\
          "MATCH (trait:Trait)-[:predicate]->(predicate:Term) "\
          "OPTIONAL MATCH (trait)-[:object_term]->(object_term:Term) "\
          "OPTIONAL MATCH (trait)-[:sex_term]->(sex_term:Term) "\
          "OPTIONAL MATCH (trait)-[:lifestage_term]->(lifestage_term:Term) "\
          "OPTIONAL MATCH (trait)-[:statistical_method_term]->(statistical_method_term:Term) "\
          "OPTIONAL MATCH (trait)-[:units_term]->(units:Term) "\
          "OPTIONAL MATCH (trait)-[data]->(meta:MetaData)-[:predicate]->(meta_predicate:Term) "\
          "OPTIONAL MATCH (meta)-[:units_term]->(meta_units_term:Term) "\
          "OPTIONAL MATCH (meta)-[:object_term]->(meta_object_term:Term) "\
          "RETURN resource, trait, predicate, object_term, units, sex_term, lifestage_term, statistical_method_term, "\
          "meta, meta_predicate, meta_units_term, meta_object_term, page "\
          "ORDER BY LOWER(meta_predicate.name)"
      query_string << limit_and_skip_clause(page, per_page)
      result = query(query_string)
      build_trait_array(result)
    end

    def by_page(page_id, page = 1, per_page = 100)
      query_sring = "MATCH (page:Page {page_id: #{page_id}})-[:trait]->(trait:Trait)"\
          "-[:supplier]->(resource:Resource) "\
        "MATCH (trait:Trait)-[:predicate]->(predicate:Term) "\
        "OPTIONAL MATCH (trait)-[:object_term]->(object_term:Term) "\
        "OPTIONAL MATCH (trait)-[:sex_term]->(sex_term:Term) "\
        "OPTIONAL MATCH (trait)-[:lifestage_term]->(lifestage_term:Term) "\
        "OPTIONAL MATCH (trait)-[:statistical_method_term]->(statistical_method_term:Term) "\
        "OPTIONAL MATCH (trait)-[:units_term]->(units:Term) "\
        "RETURN resource, trait, predicate, object_term, units, sex_term, lifestage_term, statistical_method_term"

      query_string << order_clause(by: ["LOWER(predicate.name)", "LOWER(object_term.name)",
        "LOWER(trait.literal)", "trait.normal_measurement"])
      query_string << limit_and_skip_clause(page, per_page)
      result = query(query_string)
      build_trait_array(result)
    end

    def page_ancestors(page_id)
      results = query("MATCH (page{ page_id: #{page_id}})-[:parent*]->(parent) RETURN parent")["data"]
      results.map {|result| result.first["data"]["page_id"]}
    end

    def first_pages_for_resource(resource_id)
      query_string = "MATCH (page:Page)-[:trait]->(:Trait)-[:supplier]->(:Resource { resource_id: #{resource_id}}) "\
        "RETURN DISTINCT(page) LIMIT 10"
      result = query(query_string)
      found = result["data"]
      return nil unless found
      found.map { |found_result| found_result.first["data"]["page_id"] }
    end

    def key_data(page_id)
      query_string = "MATCH (page:Page { page_id: #{page_id} })-[:trait]->(trait:Trait)"\
        "MATCH (trait:Trait)-[:predicate]->(predicate:Term) "\
        "OPTIONAL MATCH (trait)-[:object_term]->(object_term:Term) "\
        "OPTIONAL MATCH (trait)-[:sex_term]->(sex_term:Term) "\
        "OPTIONAL MATCH (trait)-[:lifestage_term]->(lifestage_term:Term) "\
        "OPTIONAL MATCH (trait)-[:statistical_method_term]->(statistical_method_term:Term) "\
        "OPTIONAL MATCH (trait)-[:units_term]->(units:Term) "\
        "RETURN trait, predicate, object_term, units, sex_term, lifestage_term, statistical_method_term "\
        "ORDER BY predicate.position, LOWER(object_term.name), "\
        "LOWER(trait.literal), trait.normal_measurement "\
        "LIMIT 100"
        # NOTE "Huge" limit, in case there are TONS of values for the same
        # predicate.
      results = query(query_string)
      build_trait_array(results).group_by {|result| result[:predicate]}
    end

    # NOTE the match clauses are hashes. Values represent the "where" clause.
    def empty_query
      {match: {}, optional: {}, with: [], return: [], order: []}
    end

    def adv_query(clauses)
      raise "no matches" unless clauses[:match].is_a?(Hash)
      raise "no returns" unless clauses.has_key?(:return)
      query_string = clause_with_where(clauses[:match], "MATCH")
      query_string << clause_with_where(clauses[:optional], "OPTIONAL MATCH")
      query_string << simple_clause(clauses[:with], "WITH")
      query_string << simple_clause(clauses[:return], "RETURN", ",")
      query_string << simple_clause(clauses[:order], "ORDER BY", ",")
      query_string << limit_and_skip_clause(clauses[:page], clauses[:per]) unless clauses[:count]
      query(query_string)
    end

    def clause_with_where(hash, directive)
      query_string = ""
      hash.each do |key, value|
        query_string << " #{directive} #{key} "
        query_string << "WHERE #{Array(value).join(" AND ")} " unless value.blank?
      end
      query_string.sub(/ $/, "")
    end

    def simple_clause(clause, directive, joiner = nil)
      joiner ||= directive
      if clause && ! clause.empty?
        " #{directive} " + clause.join(" #{joiner} ")
      else
        ""
      end
    end

    # NOTE: "count" means something different here! In .term_search it's used to
    # indicate you *want* the count; here it means you HAVE the count and are
    # passing it in! Be careful.
    def batch_term_search(term_query, options, count)
      found = 0
      batch_found = 1 # Placeholder; will update in query.
      page = 1
      while(found < count && batch_found > 0)
        batch = TraitBank.term_search(term_query, options.merge(page: page))
        batch_found = batch.size
        found += batch_found
        yield(batch)
        page += 1
      end
    end

    def term_search(term_query, options={})
      key = nil # scope
      if options[:count]
        key = "trait_bank/term_search/counts/#{Digest::MD5.hexdigest(term_query.inspect)}"
        if Rails.cache.exist?(key)
          count = Rails.cache.read(key)
          Rails.logger.warn("USING cached count: #{key} = #{count}")
          return count
        end
      end
      query_string = 
        if options[:result_type] == :record
          term_record_search(term_query, options)
        else
          term_page_search(term_query, options)
        end

      limit_and_skip = options[:page] ? limit_and_skip_clause(options[:page], options[:per]) : ""
      query_string << limit_and_skip
      result = query(query_string)

      if options[:count]
        count = result["data"] ? result["data"].first.first : 0
        Rails.cache.write(key, count, expires_in: 1.day)
        Rails.logger.warn("Cached count: #{key} = #{count}")
        count
      else
        build_trait_array(result)
      end
    end

    def parent_terms
      @parent_terms ||= "parent_term*0..#{CHILD_TERM_DEPTH}"
    end

    def op_from_filter(num_filter)
      case num_filter.op.to_sym
      when :eq
        "="
      when :gt
        ">"
      when :lt
        "<"
      else
        raise "unexpected filter op value: #{num_filter.op}"
      end
    end

    def term_filter_wheres(term_query)
      term_query.filters.map do |filter|
        term_filter_where(filter, "trait", "tgt_pred", "tgt_obj")
      end
    end

    def term_filter_where(filter, trait_var, pred_var, obj_var)
      if filter.predicate?
        "#{pred_var}.uri = \"#{filter.pred_uri}\""
      elsif filter.object_term?
        "(#{obj_var}.uri = \"#{filter.obj_uri}\" "\
        "AND #{pred_var}.uri = \"#{filter.pred_uri}\")"
      elsif filter.numeric? || filter.range?
        conv_num_val1, conv_units_uri = UnitConversions.convert(filter.num_val1, filter.units_uri)
        if filter.numeric?
          "#{pred_var}.uri = \"#{filter.pred_uri}\" AND "\
          "("\
          "(#{trait_var}.measurement IS NOT NULL "\
          "AND toFloat(#{trait_var}.measurement) #{op_from_filter(filter)} #{conv_num_val1} "\
          "AND (#{trait_var}:Trait)-[:units_term]->(:Term{ uri: \"#{conv_units_uri}\" })) "\
          "OR "\
          "(#{trait_var}.normal_measurement IS NOT NULL "\
          "AND toFloat(#{trait_var}.normal_measurement) #{op_from_filter(filter)} #{conv_num_val1} "\
          "AND (#{trait_var}:Trait)-[:normal_units_term]->(:Term{ uri: \"#{conv_units_uri}\" }))"\
          ")"\
        elsif filter.range?
          conv_num_val2, _ = UnitConversions.convert(filter.num_val2, filter.units_uri)
          "#{pred_var}.uri = \"#{filter.pred_uri}\" AND "\
          "("\
          "(#{trait_var}.measurement IS NOT NULL "\
          "AND (#{trait_var}:Trait)-[:units_term]->(:Term{ uri: \"#{conv_units_uri}\" }) "\
          "AND toFloat(#{trait_var}.measurement) >= #{conv_num_val1} "\
          "AND toFloat(#{trait_var}.measurement) <= #{conv_num_val2}) "\
          "OR "\
          "(#{trait_var}.normal_measurement IS NOT NULL "\
          "AND (#{trait_var}:Trait)-[:normal_units_term]->(:Term{ uri: \"#{conv_units_uri}\" }) "\
          "AND toFloat(#{trait_var}.normal_measurement) >= #{conv_num_val1} "\
          "AND toFloat(#{trait_var}.normal_measurement) <= #{conv_num_val2}) "\
          ") "\
        end
      else
        raise "unable to determine filter type"
      end
    end

    def term_record_search(term_query, options)
      matches = []
      matches << "(page:Page)-[:trait]->(trait:Trait)-[:supplier]->(resource:Resource)"

      if term_query.filters.any?
        matches << "(trait:Trait)-[:predicate]->(predicate:Term)-[:#{parent_terms}]->(tgt_pred:Term)"
      else
        matches << "(trait:Trait)-[:predicate]->(predicate:Term)"
      end

      # TEMP: I'm skippping clade for count on the first. This yields the wrong result, but speeds things up x2 ... for
      # the first page.
      use_clade = term_query.clade && ((options[:page] && options[:page] > 1) || !options[:count])
      object_term_in_match = term_query.filters.any?(&:object_term?)

      matches << "(page)-[:parent*0..]->(Page { page_id: #{term_query.clade.id} })" if use_clade
      matches << "(trait:Trait)-[:object_term]->(object_term:Term)-[:#{parent_terms}]->(tgt_obj:Term)" if
        object_term_in_match

      match_part = "MATCH #{matches.join(", ")}"

      wheres = term_filter_wheres(term_query)
      where_part = wheres.empty? ? "" : "WHERE #{wheres.join(" OR ")}"

      optional_matches = [
        "(trait)-[:units_term]->(units:Term)",
        "(trait)-[:normal_units_term]->(normal_units:Term)",
        "(trait)-[:sex_term]->(sex_term:Term)",
        "(trait)-[:lifestage_term]->(lifestage_term:Term)",
        "(trait)-[:statistical_method_term]->(statistical_method_term:Term)",
      ]
      # It's a bit quicker (15% or so) to skip an optional filter if you know it's in the MATCH:
      optional_matches << "(trait)-[:object_term]->(object_term:Term)" unless object_term_in_match

      optional_matches += [
        "(trait)-[:metadata]->(meta:MetaData)-[:predicate]->(meta_predicate:Term)",
        "(meta)-[:units_term]->(meta_units_term:Term)",
        "(meta)-[:object_term]->(meta_object_term:Term)",
        "(meta)-[:sex_term]->(meta_sex_term:Term)",
        "(meta)-[:lifestage_term]->(meta_lifestage_term:Term)",
        "(meta)-[:statistical_method_term]->(meta_statistical_method_term:Term)"
      ] if options[:meta]

      optional_match_part =
        if options["count"]
          ''
        else
          optional_matches.map { |match| "OPTIONAL MATCH #{match}" }.join("\n")
        end

      orders = ["LOWER(predicate.name)", "LOWER(object_term.name)", "trait.normal_measurement", "LOWER(trait.literal)"]
      orders << "meta_predicate.name" if options[:meta]
      order_part = options[:count] ? "" : "ORDER BY #{orders.join(", ")}"

      returns =
        if options[:count]
          ["count"]
        else
          %w[page trait predicate units normal_units object_term sex_term lifestage_term statistical_method_term resource]
        end

      with_count_clause = options[:count] ? "WITH count(*) AS count " : ""

      if options[:meta] && !options[:count]
        returns += %w[meta meta_predicate meta_units_term meta_object_term meta_sex_term meta_lifestage_term
          meta_statistical_method_term]
      end

      return_clause = "RETURN #{returns.join(", ")}"

      "#{match_part} "\
      "#{where_part} "\
      "#{optional_match_part} "\
      "#{with_count_clause}"\
      "#{return_clause} " #\
      # WHAT THE WHAT?!? NO ORDER?! ARE YOU LOCO?!?  ...Kinda. It super-speeds things up, so we're trying it.
      # "#{order_part} "
    end

    def term_page_search(term_query, options)
      matches = []
      wheres = []

      page_match = "MATCH (page:Page)"
      page_match << "-[:parent*]->(Page { page_id: #{term_query.clade.id} })" if term_query.clade
      matches << page_match

      term_query.filters.each_with_index do |filter, i|
        trait_var = "t#{i}"
        pred_var = "p#{i}"
        obj_var = "o#{i}"
        matches << "MATCH (page)-[:trait]->(#{trait_var}:Trait)-[:predicate]->(predicate:Term)-[:#{parent_terms}]->(#{pred_var}:Term)"
        matches << ", (#{trait_var}:Trait)-[:object_term]->(object_term:Term)-[:#{parent_terms}]->(#{obj_var}:Term)" if
          filter.object_term?
        wheres << term_filter_where(filter, trait_var, pred_var, obj_var)
      end

      with_count_clause = options[:count] ? "WITH COUNT(DISTINCT(page)) AS count " : ""
      return_clause = options[:count] ? "RETURN count" : "RETURN page"
      order_clause = options[:count] ? "" : "ORDER BY page.name"
      "#{matches.join(" ")} "\
      "WHERE #{wheres.join(" AND ")}"\
      "#{with_count_clause}"\
      "#{return_clause} "# \
      # TEMP: trying this out without the order clause, since it's SOOOO much faster...
      # "#{order_clause}"
    end

    # NOTE: this is not indexed. It could get slow later, so you should check
    # and optimize if needed. Do not prematurely optimize!
    def search_predicate_terms(query_string, page = 1, per_page = 50)
      query_string = "MATCH (trait:Trait)-[:predicate]->(term:Term) "\
        "WHERE term.name =~ \'(?i)^.*#{q}.*$\' RETURN DISTINCT(term) ORDER BY LOWER(term.name)"
      quesry_string << limit_and_skip_clause(page, per_page)
      results = query(query_string)
      return [] if results["data"].empty?
      results["data"].map {|result| result[0]["data"]}
    end

    def count_predicate_terms(q)
      quesry_string = "MATCH (trait:Trait)-[:predicate]->(term:Term) "\
        "WHERE term.name =~ \'(?i)^.*#{q}.*$\' RETURN COUNT(DISTINCT(term))"
      result = query(query_string)
      return [] if result["data"].empty?
      result["data"] ? result["data"].first.first : 0
    end

    # NOTE: this is not indexed. It could get slow later, so you should check
    # and optimize if needed. Do not prematurely optimize!
    def search_object_terms(query_string, page = 1, per_page = 50)
      query_string = "MATCH (trait:Trait)-[:object_term]->(term:Term) "\
        "WHERE term.name =~ \'(?i)^.*#{q}.*$\' RETURN DISTINCT(term) ORDER BY LOWER(term.name)"
      query_string <<  limit_and_skip_clause(page, per_page)
      results = query(query_string)
      return [] if results["data"].empty?
      results["data"].map {|result| result[0]["data"]}
    end

    # NOTE: this is not indexed. It could get slow later, so you should check
    # and optimize if needed. Do not prematurely optimize!
    def count_object_terms(query_string)
      query_string = "MATCH (trait:Trait)-[:object_term]->(term:Term) "\
        "WHERE term.name =~ \'(?i)^.*#{q}.*$\' RETURN COUNT(DISTINCT(term))"
      result = query(query_string)
      return [] if result["data"].empty?
      result["data"] ? result["data"].first.first : 0
    end

    # this method chcek if page exists it will return it, else it will create it and return it
    def page_exists?(page_id)
      result = query("MERGE (page:Page { page_id: #{page_id}}) RETURN page")
      result["data"] && result["data"].first ? result["data"].first.first : false
    end

    def meta_exists?(eol_pk)
      params = {eol_pk: eol_pk}
      result = query("MATCH (meta:MetaData { eol_pk: {eol_pk}}) RETURN meta", params)
      result["data"] && result["data"].first ? result["data"].first.first : false
    end

    def has_meta?(eol_pk)
      params = {eol_pk: eol_pk}
      result = query("match(t:Trait{eol_pk: {eol_pk}})-[:metadata]->(m:MetaData)return m", params)
      result["data"] && result["data"].first ? result["data"].first.first : false
    end

    def page_has_parent?(page, page_id)
      node = Neography::Node.load(page["metadata"]["id"], connection)
      return false unless node.rel?(:parent)
      node.outgoing(:parent).map {|n| n[:page_id]}.include? page_id
    end

    # Given a results array and the name of one of the returned columns to treat
    # as the "identifier" (meaning the field who's ID will uniquely identify a
    # row of related data ... e.g.: the "trait" for trait data)
    def results_to_hashes(results, identifier = nil)
      id_col = results["columns"].index(identifier ? identifier.to_s : "trait")
      id_col ||= 0 # If there is no trait column and nothing was specified...
      hashes = []
      previous_id = nil
      hash = nil
      results["data"].each do |row|
        row_id = row[id_col] && row[id_col]["metadata"] &&
          row[id_col]["metadata"]["id"]
        raise("Found row with no ID on row: #{row.inspect}") if row_id.nil?
        if row_id != previous_id
          previous_id = row_id
          hashes << hash unless hash.nil?
          hash = {}
        end
        results["columns"].each_with_index do |column, i|
          col = column.to_sym

          # This is pretty complicated. It symbolizes any hash that might be a
          # return value, and leaves it alone otherwise. It also checks for a
          # value in "data" first, but returns whatever it gets if that is
          # missing. Just being flexible, since neography returns a variety of
          # results.
          value = 
            if row[i]
              if row[i].is_a?(Hash)
                if row[i]["data"].is_a?(Hash)
                  row[i]["data"].symbolize_keys
                else
                  row[i]["data"] ? row[i]["data"] : row[i].symbolize_keys
                end
              else
                row[i]
              end
            else
              nil
            end

          if hash.has_key?(col)
            # NOTE: this assumes neo4j never naturally returns an array...
            if hash[col].is_a?(Array)
              hash[col] << value
            # If the value is changing (or if it's metadata)...
            elsif hash[col] != value
              # ...turn it into an array and add the new value.
              hash[col] = [hash[col], value]
            # Note the lack of "else" ... if the value is the same as the last
            # row, we ignore it (assuming it's a duplicate value and another
            # column is changing)
            end
          else
            # Metadata will *always* be returned as an array...
            # NOTE: it's important to catch columns that we KNOW could have
            # multiple values for a given "row"! ...Otherwise, the "ignore
            # duplicates" code will cause problems, above. If you know of a
            # column that could have multiple values, you need to add detection
            # for it here.
            # TODO: this isn't a very general solution. Really we should pass in
            # some knowledge of this, either something like "these columns could
            # have multiple values" or the opposite: "these columns identify a
            # row and cannot change". I prefer the latter, honestly.
            if column =~ /\Ameta/
              hash[col] = [value]
            else
              hash[col] = value unless value.nil?
            end
          end
        end
      end
      hashes << hash unless hash.nil? || hash == {}
      # Symbolize everything!
      hashes.each do |key, value|
        if value.is_a?(Hash)
          hashes[k] = value.symbolize_keys
        elsif value.is_a?(Array)
          hashes[k] = value.map {|symbol_value| symbol_value.symbolize_keys}
        end
      end
      hashes
    end

    # NOTE: this method REQUIRES that some fields have a particular name.
    # ...which isn't very generalized, but it will do for our purposes...
    def build_trait_array(results)
      hashes = results_to_hashes(results)
      data = []
      hashes.each do |hash|
        has_trait = hash.keys.include? :trait
        hash.merge!(hash[:trait]) if has_trait
        hash[:page_id] = hash[:page][:page_id] if hash[:page]
        hash[:resource_id] =
          if hash[:resource]
            if hash[:resource].is_a?(Array)
              hash[:resource].first[:resource_id]
            else
              hash[:resource][:resource_id]
            end
          else
            "MISSING"
          end
        if hash[:predicate].is_a?(Array)
          Rails.logger.error("Trait {#{hash[:trait][:resource_pk]}} from resource #{hash[:resource_id]} has "\
            "#{hash[:predicate].size} predicates")
          hash[:predicate] = hash[:predicate].first
        end

        # TODO: extract method
        if hash.has_key?(:meta)
          raise "Metadata not returned as an array" unless hash[:meta].is_a?(Array)
          length = hash[:meta].size
          raise "Missing meta column meta_predicate: #{hash.keys}" unless hash.has_key?(:meta_predicate)
          %i[meta_predicate meta_units_term meta_object_term meta_sex_term meta_lifestage_term meta_statistical_method_term].each do |column|
            next unless hash.has_key?(column)
            raise ":#{column} data was not the same size as :meta" unless hash[column].size == length
          end
          hash[:meta].compact!
          hash[:metadata] = []
          unless hash[:meta].empty?
            hash[:meta].each_with_index do |meta, i|
              meta_hash = meta
              meta_hash[:predicate] = hash[:meta_predicate] && hash[:meta_predicate][i]
              meta_hash[:object_term] = hash[:meta_object_term] && hash[:meta_object_term][i]
              meta_hash[:sex_term] = hash[:meta_sex_term] && hash[:meta_sex_term][i]
              meta_hash[:lifestage_term] = hash[:meta_lifestage_term] && hash[:meta_lifestage_term][i]
              meta_hash[:statistical_method_term] = hash[:meta_statistical_method_term] && hash[:meta_statistical_method_term][i]
              meta_hash[:units] = hash[:meta_units_term] && hash[:meta_units_term][i]
              hash[:metadata] << meta_hash
            end
          end
        end
        if has_trait
          hash[:id] = hash[:trait][:eol_pk]
        end
        data << hash
      end
      data
    end

    def resources(traits)
      resource_ids = traits.map {|trait| trait[:resource_id]}.compact.uniq
      resources = Array.new()
      resource_ids.each do |resource_id|
        resources << ResourceApi.get_resource_using_id(resource_id)
      end
      resources
    end

    def create_page(id)
      if (page = page_exists?(id))
        return page
      end
    end
    # this method chcek if resource exists it will return it, else it will create it and return it
    def find_resource(id)
      result = query("MERGE (resource:Resource { resource_id: #{id} }) "\
        "RETURN resource LIMIT 1")
      result["data"] ? result["data"].first : false
    end

    def create_resource(id)
      if (resource = find_resource(id))
        return resource
      end
    end

    # # TODO: we should probably do some checking here. For example, we should
    # # only have ONE of [value/object_term/association/literal].
    def create_trait(options, terms)
      resource_id = options[:supplier]["data"]["resource_id"]
      Rails.logger.warn "++ Create Trait: Resource##{resource_id}, "\
        "PK:#{options[:resource_pk]}"
      if trait = trait_exists?(resource_id, options[:eol_pk])
        Rails.logger.warn "++ Already exists, skipping."
        return trait
      end
      page = options.delete(:page)
      supplier = options.delete(:supplier)
      if !options[:predicate].nil? && !options[:predicate][:uri].nil? && terms.include? options[:predicate][:uri]
        predicate = terms[options[:predicate][:uri]]
        options.delete(:predicate)
      else
        predicate = parse_term(options.delete(:predicate))
        terms[predicate["data"]["uri"]]= predicate if predicate
      end

      if !options[:units].nil? && !options[:units][:uri].nil? && terms.include? options[:units][:uri]
        units = terms[options[:units][:uri]]
        options.delete(:units)
      else
        units = parse_term(options.delete(:units))
        terms[units["data"]["uri"]]= units if units
      end
      # occurrence metadata
      if !options[:lifestage_term].nil? && !options[:lifestage_term][:uri].nil? && terms.include? options[:lifestage_term][:uri]
        lifestage = terms[options[:lifestage_term][:uri]]
        options.delete(:lifestage_term)
      else
        lifestage = parse_term(options.delete(:lifestage_term))
        terms[lifestage["data"]["uri"]] = lifestage if lifestage
      end
      if !options[:sex_term].nil? && !options[:sex_term][:uri].nil?) && (terms.include? options[:sex_term][:uri])
        sex = terms[options[:sex_term][:uri]]
        options.delete(:sex_term)
      else
        sex = parse_term(options.delete(:sex_term))
        terms[sex["data"]["uri"]]= sex if sex
      end

      if !options[:statistical_method_term].nil? && !options[:statistical_method_term][:uri].nil?
        && terms.include? options[:statistical_method_term][:uri]
        statistical_method = terms[options[:statistical_method_term][:uri]]
        options.delete(:statistical_method_term)
      else
        statistical_method = parse_term(options.delete(:statistical_method_term))
        terms[statistical_method["data"]["uri"]] = statistical_method if statistical_method
      end

      if !options[:object_term].nil? && !options[:object_term][:uri].nil? && terms.include? options[:object_term][:uri]
        object_term = terms[options[:object_term][:uri]]
        options.delete(:object_term)
      else
        object_term = parse_term(options.delete(:object_term))
        terms[object_term["data"]["uri"]]= object_term if object_term
      end
      convert_measurement(options, units)
      trait = create_node(options,"Trait")
      relation_query = "match (t:Trait{eol_pk: \"#{options[:eol_pk]}\"}) match (p:Page{page_id: #{page}}) "\
      "match (s:Resource{resource_id: #{resource_id}}) match (perdicate:Term {uri: \"#{predicate["data"]["uri"]}\"})"

      relation_query = "#{relation_query} match (units:Term {uri: \"#{units["data"]["uri"]}\"})" if units
      relation_query = "#{relation_query} match (object_term:Term {uri: \"#{object_term["data"]["uri"]}\"})" if object_term
      relation_query = "#{relation_query} match (lifestage:Term {uri: \"#{lifestage["data"]["uri"]}\"})" if lifestage
      relation_query = "#{relation_query} match (sex:Term {uri: \"#{sex["data"]["uri"]}\"})" if sex
      relation_query = "#{relation_query} match (statistical_method:Term {uri: \"#{statistical_method["data"]["uri"]}\"})" if statistical_method

      relation_query = "#{relation_query} merge (p)-[:trait]->(t) merge (t)-[:supplier]->(s) merge (t)-[:predicate]->(perdicate)"
      relation_query = "#{relation_query} merge (t)-[:units_term]->(units)" if units
      relation_query = "#{relation_query} merge (t)-[:object_term]->(object_term)" if object_term
      relation_query = "#{relation_query} merge (t)-[:lifestage_term]->(lifestage)" if lifestage
      relation_query = "#{relation_query} merge (t)-[:sex_term]->(sex)" if sex
      relation_query = "#{relation_query} merge (t)-[:statistical_method_term]->(statistical_method)" if statistical_method

      query(relation_query)

      trait
    end

    def create_node(options, label)
      query = "create (n:#{label} {"
      options.each do |key, value|
        key = key.to_s
        unless value.nil?
          if value.is_a? String
            query = "#{query}#{key}: \"#{value}\","
          else
            query = "#{query}#{key}: #{value},"
          end
        end 
      end
      
      query[query.length - 1] = ''
      query ="#{query}}) return n"
      node = query(query)
      node = node["data"].first.first
      node
    end

    def relate(how, from, to)
      begin
        connection.create_relationship(how, from, to)
      rescue
        # Try again...
        begin
          sleep(0.1)
          connection.create_relationship(how, from, to)
        rescue Neography::BadInputException => e
          Rails.logger.error("** ERROR adding a #{how} relationship:\n#{e.message}")
          Rails.logger.error("** from: #{from}")
          Rails.logger.error("** to: #{to}")
          debugger
        rescue Neography::NeographyError => e
          Rails.logger.error("** ERROR adding a #{how} relationship:\n#{e.message}")
          Rails.logger.error("** from: #{from}")
          Rails.logger.error("** to: #{to}")
          debugger
        rescue Excon::Error::Socket => e
          puts "** TIMEOUT adding relationship"
          Rails.logger.error("** ERROR adding a #{how} relationship:\n#{e.message}")
          Rails.logger.error("** from: #{from}")
          Rails.logger.error("** to: #{to}")
          debugger
        rescue => e
          puts "Something else happened."
          debugger
          1
        end
      end
    end

    def check_relation(how, from, to)
      result = query("MATCH (n)-[rel:#{how}]->(r)where id(n)= #{from["metadata"]["id"]} AND id(r)= #{to["metadata"]["id"]} RETURN rel")
      result["data"].empty? ? false : true  
    end

    def add_metadata_to_trait(trait, options, terms)
      if !options[:predicate].nil? && !options[:predicate][:uri].nil? && terms.include? options[:predicate][:uri]
        predicate = terms[options[:predicate][:uri]]
        options.delete(:predicate)
      else
        predicate = parse_term(options.delete(:predicate))
        terms[predicate["data"]["uri"]]= predicate if predicate
      end

      if !options[:units].nil? && !options[:units][:uri].nil? && terms.include? options[:units][:uri]
        units = terms[options[:units][:uri]]
        options.delete(:units)
      else
        units = parse_term(options.delete(:units))
        terms[units["data"]["uri"]]= units if units
      end

      if !options[:object_term].nil? && !options[:object_term][:uri].nil? && terms.include? options[:object_term][:uri]
        object_term = terms[options[:object_term][:uri]]
        options.delete(:object_term)
      else
        object_term = parse_term(options.delete(:object_term))
        terms[object_term["data"]["uri"]]= object_term if object_term
      end
      convert_measurement(options, units)
      if (meta = meta_exists?(options[:eol_pk]))
      else
        meta = create_node(options,"MetaData")
      end
      query = "match (t:Trait {eol_pk: \"#{trait.first["data"]["eol_pk"]}\"}) "\
      "match (m:MetaData {eol_pk: \"#{options[:eol_pk]}\"}) match(p:Term {uri: \"#{predicate["data"]["uri"]}\"})"
      query = "#{query} match(units:Term {uri: \"#{units["data"]["uri"]}\"})" if units
      query = "#{query} match(object:Term {uri: \"#{object_term["data"]["uri"]}\"})" if object_term
      query = "#{query} merge (t)-[:metadata]->(m) merge (m)-[:predicate]->(p)"
      query = "#{query} merge (m)-[:units_term]->(units)" if units
      query = "#{query} merge (m)-[:object_term]->(object) return m" if object_term

      meta = query(query).first.first
      meta
    end
    def add_parent_to_page(parent, page)
      if parent.nil?
        if page.nil?
          return {added: false, message: 'Cannot add parent from nil to nil!'}
        else
          return {added: false, message: "Cannot add parent to nil parent for page #{page["data"]["page_id"]}"}
        end
      elsif page.nil?
        return {added: false, message: "Cannot add parent for nil page to parent #{parent["data"]["page_id"]}"}
      end
      if page["data"]["page_id"] == parent["data"]["page_id"]
        return {added: false, message: "Skipped adding :parent relationship to itself: #{parent["data"]["page_id"]}"}
      end
      begin
        relate("parent", page, parent)
        return {added: true}
      rescue Neography::PropertyValueException
        return {added: false, message: "Cannot add parent for page #{page["data"]["page_id"]} to "\
          "#{parent["data"]["page_id"]}"}
      end
    end

  # old code
    # # NOTE: this only work on IMPORT. Don't try to run it later! TODO: move it
    # # to import. ;)
    def convert_measurement(trait, units)
      return unless trait[:literal]
      trait[:measurement] = begin
        Integer(trait[:literal])
      rescue
        Float(trait[:literal]) rescue trait[:literal]
      end
      # If we converted it (and thus it is numeric) AND we see units...
      if trait[:measurement].is_a?(Numeric) &&
         units && units["data"] && units["data"]["uri"]
        (n_val, n_unit) = UnitConversions.convert(trait[:measurement], units["data"]["uri"])
        trait[:normal_measurement] = n_val
        trait[:normal_units] = n_unit
      else
        trait[:normal_measurement] = trait[:measurement]
        if units && units["data"] && units["data"]["uri"]
          trait[:normal_units] = units["data"]["uri"]
        else
          trait[:normal_units] = "missing"
        end
      end
    end

    def parse_term(term_options)
      return nil if term_options.nil?
      #next line why?
      #return term_options if term_options.is_a?(Hash)
      return create_term(term_options)
    end

    def create_term(options)
      if (existing_term = term(options[:uri])) # NO DUPLICATES!
        return existing_term unless options.delete(:force)
      end
      options[:section_ids] = options[:section_ids] ?
        Array(options[:section_ids]).join(",") : ""
      options[:definition] ||= "{definition missing}"
      options[:definition].gsub!(/\^(\d+)/, "<sup>\\1</sup>")
      if existing_term
        options.delete(:uri) # We already have this.
        begin
          connection.set_node_properties(existing_term, remove_nils(options)) # Cypher is alergic to nils.
        # What I saw was a Neography::PropertyValueException: "null value not supported" ...but I want to catch
        # everything
        rescue => e
          puts "ERROR: failed to update term #{options[:uri]}"
          puts "EXISTING: #{existing_term.inspect}"
          puts "DESIRED: #{options.inspect}"
          puts "You will need to fix this manually. Make note!"
        end
        return existing_term
      end
      begin
        term_node = create_node(options , "Term")
        count = Rails.cache.read("trait_bank/terms_count") || 0
        Rails.cache.write("trait_bank/terms_count", count + 1)
      rescue => e
        raise e
      end
      term_node
    end

    def remove_nils(hash)
      bad_keys = [] # Never modify a hash as you iterate over it.
      hash.each { |key, val| bad_keys << key if val.nil? }
      # NOTE: removing the key entirely would just skip updating it; we want the value to be empty.
      bad_keys.each {|key| hash[key] = ""}
      hash
    end

    def child_has_parent(curi, puri)
      cterm = term(curi)
      pterm = term(puri)
      raise "missing child" if cterm.nil?
      raise "missing parent" if pterm.nil?
      child_term_has_parent_term(cterm, pterm)
    end

    def child_term_has_parent_term(cterm, pterm)
      relate(:parent_term, cterm, pterm)
    end

    def term(uri)
      @terms ||= {}
      return @terms[uri] if @terms.key?(uri)
      if uri.present?
        uri.gsub(/"/, '""')
      end
      
      result = query(%Q{MATCH (term:Term { uri: "#{uri}" }) RETURN term})
      return nil unless result["data"] && result["data"].first
      @terms[uri] = result["data"].first.first
    end

    def update_term(opts)
      sets = []
      sets += %i(name definition attribution comment sections).map do |field|
        opts[field] = "" if opts[field].nil?
        "term.#{field} = '#{opts[field].gsub("'", "''")}'"
      end
      sets += %i(is_hidden_from_glossary is_hidden_from_glossary).map do |field|
        "term.#{field} = #{opts[field] ? 'true' : 'false'}'"
      end
      query = "MATCH (term:Term { uri: '#{opts[:uri]}' }) SET #{sets.join(', ')} RETURN term"
      result = query(query)
      raise ActiveRecord::RecordNotFound if result.nil?
      result["data"].first.first.symbolize_keys
    end

    def term_as_hash(uri)
      return nil if uri.nil? # Important for param-management!
      hash = term(uri)
      raise ActiveRecord::RecordNotFound if hash.nil?
      # NOTE: this step is slightly annoying:
      hash["data"].symbolize_keys
    end

    def get_name(trait, which = :predicate)
      if trait && trait.has_key?(which)
        if trait[which].has_key?(:name)
          trait[which][:name]
        elsif trait[which].has_key?(:uri)
          humanize_uri(trait[which][:uri]).downcase
        else
          nil
        end
      else
        nil
      end
    end

    def find_trait(eol_pk, resource_id)
      params = {eol_pk: eol_pk, resource_id: resource_id }
      result = query("MATCH (trait:Trait {eol_pk: {eol_pk}})-[:supplier]->(res:Resource {resource_id: {resource_id}}) RETURN trait", params)
      result["data"] ? result["data"].first : false
    end

    def find_traits(occurrence_id, resource_id)
      params = {occurrence_id: occurrence_id, resource_id: resource_id }
      result = query("MATCH (trait:Trait {occurrence_id: {occurrence_id}})-[:supplier]->(res:Resource {resource_id: {resource_id}}) RETURN trait", params)
      result["data"] ? result["data"] : false
    end
  end
end