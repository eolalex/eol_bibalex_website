class ScientificName < ApplicationRecord
  belongs_to :taxonomic_status
  belongs_to :node
  belongs_to :pages,  class_name: 'Page', foreign_key: 'pages_id'
  scope :synonym, -> { where(is_preferred: false) }
end
