module PagesHelper
  def classification(node)
    ancestors = []
    tree = []
    res = NodeAncestorsFlattened.where(generated_node_id: node.generated_node_id,resource_id: node.resource_id)
    if res.count > 0
      ancestors_ids_string = res.first.node_ancestors_ids
      ancestors_ids_array = ancestors_ids_string.split(",").map{ |s| s.to_i }
      ancestors_ids_array_depth_desc = ancestors_ids_array.reverse
      ancestors = Node.where(generated_node_id:ancestors_ids_array_depth_desc,resource_id: node.resource_id).order("field(generated_node_id, #{ancestors_ids_array_depth_desc.join(',')})")
      #ancestors=  node.node_ancestors.order('depth DESC')
      #children = node.children.order('depth ASC')
      ancestors.each do |node_ancestor|
        # tree.push(node_ancestor.ancestor)
        tree.push(node_ancestor)
      end
    end 
    tree.push(node)
    # children.each do |child|
     # tree.push(child.node)
    # end
    tree  
  end
  
  def classification_children(node)
    # row = [node,level]
    # children = [row row ....etc]
    children = []
    level = 0
    # children_ids_array=[]
    parent_id = node.generated_node_id
    10.times do
      returned_children = NodeDirectParent.where(direct_parent_id: parent_id,resource_id: node.resource_id)
      break unless returned_children.count > 0
      if returned_children.count > 1
        returned_children.each do|child|
          # children_ids_array << child.generated_node_id
          res = Node.where(generated_node_id: child.generated_node_id,resource_id: node.resource_id)
          row = []
          row << res.first
          row << level
          children << row
        end
        break
      end
      # children_ids_array << returned_children.first.generated_node_id
      res = Node.where(generated_node_id: returned_children.first.generated_node_id,resource_id: node.resource_id)
      row = []
      row << res.first
      row << level
      children << row
      parent_id = returned_children.first.generated_node_id
      level = level + 1
    end
    # children= Node.where(generated_node_id:children_ids_array,resource_id: node.resource_id).order("field(generated_node_id, #{children_ids_array.join(',')})")
    children
  end
  
 def classification_overview(node)
    ancestors = []
    tree = []
    res =  NodeAncestorsFlattened.where(generated_node_id: node.generated_node_id,resource_id: node.resource_id)
    if res.count > 0
    	ancestors_ids_string = res.first.node_ancestors_ids
    	ancestors_ids_array = ancestors_ids_string.split(",").map{ |s| s.to_i }
    	ancestors= Node.where(generated_node_id:ancestors_ids_array,resource_id: node.resource_id)
    	#ancestors=  node.node_ancestors.order('depth DESC')
    	ancestors.each do |node_ancestor|
      	#tree.push(node_ancestor.ancestor)
      	tree.push(node_ancestor)
    	end
     end
    tree.push(node)
    tree
  end  
  
  def get_resources(names)
    resources = Hash.new { |hash, key| hash[key] = [] }
    names.each do |name|
      resource_id = name.resource_id
      key = name.try(:canonical_form)
      key = name.try(:string) if key.nil?
      resource_info = get_resource_info(resource_id)
      resources[key] << resource_info 
      end 
      resources
  end
  
  def get_resource_info(resource_id)
    resource = ResourceApi.get_resource_using_id(resource_id)
      if !resource.nil?
        resource_info =  Resource.new(id: resource["id"].to_i, name: resource["name"], origin_url: resource["origin_url"], type: resource["type"], path: resource["path"])
      end
      resource_info
   end   
end

