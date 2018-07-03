class ScientificName < ApplicationRecord
  belongs_to :taxonomic_status, class_name: "TaxonomicStatus", foreign_key: "taxonomic_statuses_id"
  belongs_to :node, inverse_of: :scientific_names
  belongs_to :page,  class_name: 'Page', foreign_key: 'pages_id'
  scope :synonym, -> { where(is_preferred: false) }
end
