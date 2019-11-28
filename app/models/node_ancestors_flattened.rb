class NodeAncestorsFlattened < ApplicationRecord
  validates :generated_node_id, uniqueness: { scope: :resource_id}
end
