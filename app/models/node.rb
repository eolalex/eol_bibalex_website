class Node < ApplicationRecord
  belongs_to :resource, inverse_of: :nodes
  belongs_to :rank
end
