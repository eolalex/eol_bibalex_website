class Node < ApplicationRecord

  has_many :children, class_name: 'Node', foreign_key: :parent_id
  belongs_to :rank, optional: true
  has_many :pages_node
  has_many :pages, through: :pages_node  
  has_many :scientific_names, class_name: "ScientificName", primary_key: 'id', foreign_key: 'nodes'
  has_many :vernaculars, class_name: "Vernacular",primary_key: 'id', foreign_key: 'nodes' 
  has_many :node_ancestors, class_name: "NodeAncestor", foreign_key: 'node_id'
  belongs_to :parent, class_name: 'Node', optional: true
end

