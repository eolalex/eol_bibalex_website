class AddNativeNodeToPage < ActiveRecord::Migration[5.1]
  def change
    add_reference :pages, :node
  end
end
