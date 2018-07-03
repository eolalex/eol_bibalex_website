class RemoveMediumIdFromPages < ActiveRecord::Migration[5.1]
  def change
    remove_reference :pages, :medium
  end
end
