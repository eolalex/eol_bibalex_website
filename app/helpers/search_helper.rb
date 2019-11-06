module SearchHelper

  def closest_ancestor(page)
    node = page.node
    node_ancestors_flattened = NodeAncestorsFlattened.where(generated_node_id: node.generated_node_id, resource_id: node.resource_id)
    
    if node_ancestors_flattened.count > 0 && !node_ancestors_flattened.first.node_ancestors_ids.nil?
      ancestors_ids_string = node_ancestors_flattened.first.node_ancestors_ids
      ancestors_ids_array = ancestors_ids_string.split(",").map{ |s| s.to_i }
      closest_ancestor = Node.where(generated_node_id:ancestors_ids_array, resource_id: node.resource_id, landmark: 1).last
    end
    
    closest_ancestor
  end
  
end