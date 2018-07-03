class NodeAncestor < ActiveRecord::Base
  belongs_to :node, class_name: 'Node', foreign_key: 'node_id'
  belongs_to :ancestor, class_name: 'Node', foreign_key: 'ancestor_id' 
end
