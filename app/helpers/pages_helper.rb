module PagesHelper
  def classification(nodes)
    ancestors = {}
    nodes.each do |node|
      ancestors[node.id] =  node.node_ancestors.order('depth DESC')
    end
    ancestors
  end
end

