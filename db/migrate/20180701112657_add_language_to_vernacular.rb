class AddLanguageToVernacular < ActiveRecord::Migration[5.1]
  def change
    add_reference :vernaculars, :language
  end
end
