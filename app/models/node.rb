class Node < ApplicationRecord
  belongs_to :rank
  has_many :children, class_name: 'Node', foreign_key: :parent_id
end
