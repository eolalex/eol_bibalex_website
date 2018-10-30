class Vernacular < ApplicationRecord
  belongs_to :node
  belongs_to :page
  belongs_to :language
  validates_uniqueness_of :id
end
