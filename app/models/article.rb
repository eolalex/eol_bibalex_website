class Article < ApplicationRecord
  searchkick
  belongs_to :langauges
  belongs_to :licenses
  belongs_to :locations
  belongs_to :bibliographic_citation
  
  has_many :attributions, as: :content
  has_many :references, as: :parent
  has_many :referents, through: :references
  has_many :page_contents, as: :content
  
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
