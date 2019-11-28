class Rank < ActiveRecord::Base
  has_many :nodes, class_name: 'Node', foreign_key: 'ranks_id'
  validates_uniqueness_of :id
end
