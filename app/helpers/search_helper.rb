module SearchHelper

  def closest_ancestor(page)
    node = page.node
    node_ancestors_flattened = NodeAncestorsFlattened.where(generated_node_id: node.generated_node_id, resource_id: node.resource_id)
    
    if node_ancestors_flattened.count > 0 && !node_ancestors_flattened.first.minimal_context_ancestor_id.nil?
      ancestor_id = node_ancestors_flattened.first.minimal_context_ancestor_id.to_i
      closest_ancestor = Node.where(generated_node_id: ancestor_id, resource_id: node.resource_id).first
    end
    closest_ancestor
  end
  
end