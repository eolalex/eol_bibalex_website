class Vernacular < ApplicationRecord
  belongs_to :node
  belongs_to :page
  belongs_to :language
  validates_uniqueness_of :id
  
  searchkick word_start: ["name_string"]
  
  def search_data
    {
      type: "vernacular",
      id: id,
      lang_id: language_id,
      name_string: string.downcase,
      page_id: page_id
    }
  end
  
end
