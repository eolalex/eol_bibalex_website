class Term < ApplicationRecord
  validates_uniqueness_of :uri
end
