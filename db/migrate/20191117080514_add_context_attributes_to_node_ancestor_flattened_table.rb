class AddContextAttributesToNodeAncestorFlattenedTable < ActiveRecord::Migration[5.1]
  def change
    add_column :node_ancestors_flatteneds, :minimal_context_ancestor_id, :mediumText
    add_column :node_ancestors_flatteneds, :abbreviated_context_ancestors_ids, :mediumText
    add_column :node_ancestors_flatteneds, :extended_context_ancestors_ids, :mediumText
  end
end
