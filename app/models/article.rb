class Article < ApplicationRecord
  belongs_to :langauges
  belongs_to :licenses
  belongs_to :locations
end
