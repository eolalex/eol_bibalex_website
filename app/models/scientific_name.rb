class ScientificName < ApplicationRecord
  belongs_to :taxonomic_status
  belongs_to :node, inverse_of: :scientific_names
  belongs_to :page
  scope :synonym, -> { where(is_preferred: false) }
end
