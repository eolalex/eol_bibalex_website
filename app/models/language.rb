class Language < ApplicationRecord
  validates_uniqueness_of :id
end
