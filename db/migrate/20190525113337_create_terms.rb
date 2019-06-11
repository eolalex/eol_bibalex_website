class CreateTerms < ActiveRecord::Migration[5.1]
  def change
    create_table :terms do |t|
      t.string :uri
      t.string :name
      t.string :term_type
      t.text :definition
      t.text :comment
      t.text :attribution
      t.string :section_ids
      t.integer :position
      t.boolean :is_hidden_from_overview
      t.boolean :is_hidden_from_glossary
      t.boolean :is_hidden_from_select
      
      t.timestamps
    end
  end
end
