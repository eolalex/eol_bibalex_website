class ScientificName < ApplicationRecord
  belongs_to :taxonomic_status
  belongs_to :node
  belongs_to :page
  scope :synonym, -> { where(is_preferred: false) }
end
