class Reference < ApplicationRecord
  belongs_to :referents
  belongs_to :parent, polymorphic: true, inverse_of: :references
end
