class TaxonomicStatus < ApplicationRecord
  has_many :scientific_names, inverse_of: :taxonomic_status
  
end
