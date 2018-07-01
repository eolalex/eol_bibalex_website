class Node < ApplicationRecord
  belongs_to :rank, class_name: 'Rank', primary_key: 'id', foreign_key: 'ranks_id'
  # belongs_to :ranks
end
