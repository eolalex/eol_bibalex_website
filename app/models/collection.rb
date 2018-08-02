class Collection < ApplicationRecord
  # searchkick

  has_many :collected_pages, -> { order("position asc") }, inverse_of: :collection, dependent: :destroy
  has_many :pages, -> { order("collected_pages.created_at desc") }, through: :collected_pages
  has_and_belongs_to_many :users

  accepts_nested_attributes_for :collected_pages, allow_destroy: true

  validates :name, presence: true
  enum default_sort: [ :position, :sci_name, :sci_name_rev, :sort_field,
    :sort_field_rev, :hierarchy ]
    
  def search_data
    {
      id: id
    }
  end

end
