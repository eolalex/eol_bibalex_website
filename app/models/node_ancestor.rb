class NodeAncestor < ActiveRecord::Base
  belongs_to :node, class_name: 'Node', foreign_key: 'node_generated_node_id', primary_key: 'generated_node_id'
  belongs_to :ancestor, class_name: 'Node', foreign_key: 'ancestor_generated_node_id' , primary_key: 'generated_node_id', optional: true
  validates :node_generated_node_id, uniqueness: {scope: [:ancestor_generated_node_id, :depth, :resource_id]}
end
