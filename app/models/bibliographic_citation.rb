class BibliographicCitation < ApplicationRecord
  has_many :articles, inverse_of: :bibliographic_citation
  has_many :media, inverse_of: :bibliographic_citation
end
