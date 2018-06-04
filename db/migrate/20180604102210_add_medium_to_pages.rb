class AddMediumToPages < ActiveRecord::Migration[5.1]
  def change
    add_reference :pages, :medium, foreign_key: true
  end
end
