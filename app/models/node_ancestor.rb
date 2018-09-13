class NodeAncestor < ActiveRecord::Base
  belongs_to :node, class_name: 'Node', foreign_key: 'node_generated_node_id'
  belongs_to :ancestor, class_name: 'Node', foreign_key: 'ancestor_generated_node_id' 
end
