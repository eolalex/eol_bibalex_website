module PagesHelper
  def classification(node)
    ancestors = []
    children = []
    ancestors=  node.node_ancestors.order('depth DESC')
    children = node.children.order('depth ASC')
   return  ancestors,children  
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

