class CollectedPage < ActiveRecord::Base
  require 'acts_as_list'

  has_many :collected_pages_media, inverse_of: :collected_page
  has_many :media, through: :collected_pages_media
  has_and_belongs_to_many :articles
  has_and_belongs_to_many :links

  belongs_to :page, inverse_of: :collected_pages
  belongs_to :collection, inverse_of: :collected_pages

  validates_presence_of :collection
  validates_presence_of :page
  validates_uniqueness_of :page_id, scope: :collection_id

  acts_as_list scope: :collection
  counter_culture :collection, column_name: :collected_pages_count, touch: true

  searchkick word_start: [:scientific_name_string]
  def search_data
    {
       type: "collected_page",
       page_id: page.id,
       collection_id: collection_id,
       scientific_name_string: scientific_name_string.downcase
    }
  end

 def collection_id
   collection.id
 end

  def self.find_pages(q, collection_id)
    CollectedPage.search do
      q = "*#{q}.downcase" unless q[0] == "*"
      fulltext q do
        fields(:name, :scientific_name, :preferred_scientific_names, :synonyms, :vernaculars)
      end
      with(:collection_id, collection_id)
    end
  end

  # For convenience, this is duck-typed from CollectionAssociation (q.v.)
  def item
    page
  end

  # NOTE: we could achieve this with delegation, but: meh. That's not as clear.
  def name
    page.name
  end

  def scientific_name_string
    page.scientific_name
  end

  def medium
    media.first
  end

  def medium_icon_url
    medium.try(:medium_icon_url) or page.icon
  end
  alias_method :icon, :medium_icon_url

  def small_icon_url
    medium.try(:small_icon_url) or page.medium.try(:small_icon_url)
  end
end

