class PageContent < ApplicationRecord
  belongs_to :page
  belongs_to :content, polymorphic: true, inverse_of: :page_contents
  enum trust: [ :unreviewed, :trusted, :untrusted ]
  
  scope :media_by_subclass, -> subclass {
    Medium.where(id: joins("JOIN media ON (media.id = "\
      "page_contents.content_id AND media.subclass = "\
      "'#{Medium.subclasses[subclass]}')").
    where(content_type: "Medium").pluck(:content_id)) }
  scope :images, -> { media_by_subclass(:image) }
  scope :sounds, -> { media_by_subclass(:sound) }
  scope :videos, -> { media_by_subclass(:video) }
  validates_uniqueness_of :id
end
