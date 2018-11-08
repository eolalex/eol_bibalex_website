class Reference < ApplicationRecord
  belongs_to :referent
  belongs_to :parent, polymorphic: true, inverse_of: :references
  validates_uniqueness_of :id
end
