class Vernacular < ApplicationRecord
  belongs_to :node, class_name: 'Node', foreign_key: 'nodes_id'
  belongs_to :page,  class_name: 'Page', foreign_key: 'pages_id'
  belongs_to :language, class_name: 'Language', foreign_key: 'languages_id'
end
