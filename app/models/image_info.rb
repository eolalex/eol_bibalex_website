class ImageInfo < ApplicationRecord
  self.table_name = "image_info"
  belongs_to :medium
  validates_uniqueness_of :medium_id
end
