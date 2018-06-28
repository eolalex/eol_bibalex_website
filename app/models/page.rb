class Page < ApplicationRecord
    has_many :collected_pages, inverse_of: :page
end
