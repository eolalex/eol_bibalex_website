class Referent < ApplicationRecord
  has_many :references
  validates_uniqueness_of :id
end
