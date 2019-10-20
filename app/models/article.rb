class Article < ApplicationRecord
  searchkick word_start: [:title]
  belongs_to :langauge, optional: true
  belongs_to :license, optional: true
  belongs_to :location, optional: true
  belongs_to :bibliographic_citation, optional: true
  
  has_many :attributions, as: :content
  has_many :references, as: :parent
  has_many :referents, through: :references
  has_many :page_contents, as: :content
  
  validates_uniqueness_of :id
  
  def search_data
    {
      type: "article",
      id: id,
      # ancestry_ids: ancestry_ids,
      page_ids: [
        page_contents.each do |content|
          content.page_id
        end
      ],
      title: name.downcase,
      language_id: language_id
    }
  end
  
  def ancestry_ids
      page_contents.pluck(:page_id)
  end
end
