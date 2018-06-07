class ScientificName < ApplicationRecord
  belongs_to :taxonomic_status, inverse_of: :scientific_names
  scope :synonym, -> { where(is_preferred: false) }
end
