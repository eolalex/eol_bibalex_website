class License < ApplicationRecord
   validates_uniqueness_of :id
end
