module PagesHelper
  def classification(node)
    ancestors = []
    children = []
    ancestors=  node.node_ancestors.order('depth DESC')
    children = node.children.order('depth ASC')
    tree = []
    ancestors.each do |node_ancestor|
     tree.push(node_ancestor.ancestor)
    end 
    tree.push(node)
    children.each do |child|
      tree.push(child.node)
    end
    tree    
  end
 def classification_overview(node)
    ancestors = []
    ancestors=  node.node_ancestors.order('depth DESC')
    tree = []
    ancestors.each do |node_ancestor|
     tree.push(node_ancestor.ancestor)
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

