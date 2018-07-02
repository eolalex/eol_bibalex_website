class AddTaxonomicStatusToScientificName < ActiveRecord::Migration[5.1]
  def change
    add_reference :scientific_names, :taxonomic_status
  end
end
