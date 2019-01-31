class OccurrenceMap < ApplicationRecord
  belongs_to :page
  validates_uniqueness_of   :resource_id, scope: :page_id
end
