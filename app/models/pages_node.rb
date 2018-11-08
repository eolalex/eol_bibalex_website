class PagesNode < ApplicationRecord
  belongs_to :page
  belongs_to :node
  validates_uniqueness_of :id
end
