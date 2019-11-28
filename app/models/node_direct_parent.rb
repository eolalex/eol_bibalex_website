class NodeDirectParent < ApplicationRecord
  belongs_to :node, class_name: 'Node', foreign_key: 'generated_node_id', primary_key: 'generated_node_id'
  validates :generated_node_id, uniqueness: { scope: :resource_id}
end
