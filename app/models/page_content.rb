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

  include Elasticsearch::Model

  before_commit on: [:create] do
    __elasticsearch__.index_document(index: "page_contents_#{self.content_type.downcase}", refresh: true)
  end

  after_commit on: [:update] do
      __elasticsearch__.update_document(index: "page_contents_#{self.content_type.downcase}", refresh: true)
  end

  after_commit on: [:destroy] do
    __elasticsearch__.delete_document(index: "page_contents_#{self.content_type.downcase}", refresh: true)
  end

  class << self

    def bulk_insert_elasticsearch(starting_index, type)
      batch_for_bulk = []
      PageContent.where(id: starting_index..(starting_index + 999), content_type: type.capitalize).each do |record|
        batch_for_bulk.push({ index: { _id: record.id, data: record }}) 
      end
      unless batch_for_bulk.empty?
        __elasticsearch__.client.bulk(
          index: "page_contents_#{type.downcase}",
          type: "_doc",
          body: batch_for_bulk
        )
      end
    end

    def reindex (type)
      __elasticsearch__.client.indices.delete index: "page_contents_#{type.downcase}" rescue nil
      (1..PageContent.last.id).step(1000).each do |starting_index|
        PageContent.bulk_insert_elasticsearch(starting_index, type)
      end
    end
  end
end
