class PageContent < ApplicationRecord
  enum trust: [ :unreviewed, :trusted, :untrusted ]
end
