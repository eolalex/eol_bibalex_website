class Link < ApplicationRecord
  belongs_to :languages
  has_many :page_contents, as: :content
  has_many :references, as: :parent
  has_many :referents, through: :references

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
