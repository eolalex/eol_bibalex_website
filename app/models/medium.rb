class Medium < ApplicationRecord
  has_many :pages, inverse_of: :medium
end
