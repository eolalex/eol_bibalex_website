class Article < ApplicationRecord
  belongs_to :langauge, optional: true
  belongs_to :license, optional: true
  belongs_to :location, optional: true
  belongs_to :bibliographic_citation, optional: true

  has_many :attributions, as: :content
  has_many :references, as: :parent
  has_many :referents, through: :references
  has_many :page_contents, as: :content

  validates_uniqueness_of :id

  searchkick
  def search_data
    {
      id: id,
      ancestry_ids: ancestry_ids 
    }
  end

  def ancestry_ids
    page_contents.pluck(:pages_id)
  end
end
