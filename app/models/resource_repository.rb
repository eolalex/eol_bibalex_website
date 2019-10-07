require 'elasticsearch/persistence'
# require 'singleton'
class ResourceRepository
  
  include Elasticsearch::Persistence::Repository
  # include Elasticsearch::Persistence::Repository::DSL
  
  index_name 'resources'
  document_type 'resource'
  klass Resource
  
  settings number_of_shards: 1 do
    mapping do
      indexes :id, type: :integer
      indexes :name, type: :text
      indexes :content_partner_id, type: :integer
    end
  end
end
