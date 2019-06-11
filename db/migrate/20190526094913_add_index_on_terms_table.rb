class AddIndexOnTermsTable < ActiveRecord::Migration[5.1]
  def change
    add_index :terms, :uri , :name => 'uri_index'
  end
end
