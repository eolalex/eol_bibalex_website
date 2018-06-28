class ScientificName < ApplicationRecord
  belongs_to :taxonomic_status, inverse_of: :scientific_names
  belongs_to :node, inverse_of: :scientific_names
  belongs_to :pages,  class_name: 'Page', foreign_key: 'pages_id'
  scope :synonym, -> { where(is_preferred: false) }
end
