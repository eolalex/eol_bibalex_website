class AddNodeToVernacular < ActiveRecord::Migration[5.1]
  def change
    add_reference :vernaculars, :node
  end
end
