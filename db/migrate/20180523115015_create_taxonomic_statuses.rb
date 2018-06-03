class CreateTaxonomicStatuses < ActiveRecord::Migration[5.1]
  def change
    create_table :taxonomic_statuses do |t|
      t.string :name
      t.boolean :is_preferred
      t.boolean :is_problematic
      t.boolean :is_alternative_preferred
      t.boolean :can_merge

      t.timestamps
    end
  end
end
