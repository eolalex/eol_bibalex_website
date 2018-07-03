class Rank < ApplicationRecord
  has_many :nodes, class_name: 'Node', foreign_key: 'ranks_id'
end
