class Node < ApplicationRecord
  belongs_to :rank
  belongs_to :page, inverse_of: :nodes
  has_many :children, class_name: 'Node', foreign_key: :parent_id
end
