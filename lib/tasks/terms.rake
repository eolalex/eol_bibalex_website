
def main_method
  # result = TraitBank.get_terms_from_api
  skip = 0;
  returned_count_string = `wget --header "Authorization: JWT \`cat /var/www/eol_website_alt/api.token\`" https://eol.org/service/cypher?query="MATCH (n:Term) RETURN count(n) LIMIT 1;" -O -`
  returned_count_hash = eval(returned_count_string)
  terms_count = returned_count_hash[:data].first.first
  
    while (skip-5000) < terms_count do
    returned_string = `wget --header "Authorization: JWT \`cat /var/www/eol_website_alt/api.token\`" https://eol.org/service/cypher?query="MATCH (n:Term) RETURN n order by ID(n) SKIP #{skip} LIMIT 5000;" -O -`
    returned_hash = eval(returned_string)
    data = returned_hash[:data]
    data.each do |term|
      term_data = term.first[:data]
      # res = Term.where(uri: term_data[:uri])
      res = Term.where('binary uri = ?', term_data[:uri])
      if res.count < 1
        res = Term.create(uri: term_data[:uri], name: term_data[:name], term_type: term_data[:type], definition: term_data[:definition], comment: term_data[:comment],
                        attribution: term_data[:attribution], section_ids: term_data[:section_ids], is_hidden_from_overview: term_data[:is_hidden_from_overview],
                        is_hidden_from_glossary: term_data[:is_hidden_from_glossary], is_hidden_from_select: term_data[:is_hidden_from_select], position: term_data[:position]
                        )
      else
        debugger
        res.first.update_attributes(name: term_data[:name], term_type: term_data[:type], definition: term_data[:definition], comment: term_data[:comment],
                        attribution: term_data[:attribution], section_ids: term_data[:section_ids], is_hidden_from_overview: term_data[:is_hidden_from_overview],
                        is_hidden_from_glossary: term_data[:is_hidden_from_glossary], is_hidden_from_select: term_data[:is_hidden_from_select], position: term_data[:position]
                        )
      end
    end
    skip = skip + 5000
  end

end
namespace :terms do
  desc "TODO"
  task :get_terms => :environment do
    main_method
  end
end
