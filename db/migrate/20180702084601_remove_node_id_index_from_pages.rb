class RemoveNodeIdIndexFromPages < ActiveRecord::Migration[5.1]
  def change
    remove_index "pages", name: "index_pages_on_node_id"
  end
end
