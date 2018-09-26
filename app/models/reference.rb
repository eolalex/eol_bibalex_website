class Reference < ApplicationRecord
  belongs_to :referent
  belongs_to :parent, polymorphic: true, inverse_of: :references
end
