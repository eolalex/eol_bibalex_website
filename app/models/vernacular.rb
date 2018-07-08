class Vernacular < ApplicationRecord
  belongs_to :node
  belongs_to :page
  belongs_to :language
end
