class Node < ApplicationRecord

  has_many :children, class_name: 'Node', foreign_key: :parent_id
  belongs_to :rank, optional: true
  has_many :references, as: :parent
  has_many :pages_node
  has_many :pages, through: :pages_node  
  has_many :scientific_names
  has_many :vernaculars
  has_many :node_ancestors, class_name: "NodeAncestor", foreign_key: 'node_id'
  belongs_to :parent, class_name: 'Node', optional: true

end

