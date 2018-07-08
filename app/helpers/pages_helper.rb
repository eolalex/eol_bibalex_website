module PagesHelper
  def classification(node)
    ancestors = {}
      ancestors[node.id] =  node.node_ancestors.order('depth DESC')
  end
end

