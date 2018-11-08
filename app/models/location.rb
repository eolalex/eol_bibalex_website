class Location < ApplicationRecord
  has_many :articles, inverse_of: :location
  has_many :media, inverse_of: :location
  validates_uniqueness_of :id
end
