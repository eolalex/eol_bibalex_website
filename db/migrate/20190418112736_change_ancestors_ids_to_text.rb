class ChangeAncestorsIdsToText < ActiveRecord::Migration[5.1]
  def change
    change_column :node_ancestors_flatteneds, :node_ancestors_ids, :text
  end
end
