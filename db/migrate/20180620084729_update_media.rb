class UpdateMedia < ActiveRecord::Migration[5.1]
  def change
    change_table :media do |t|
      t.change :format, :integer, {null: false, default: 1}
      t.change :subclass, :integer, {null: false, default: 1}
      t.change :guid,:string, null:false
      # t.change :licenses_id, :integer, null:false
      t.change :owner , :string,null:false
      t.change :base_url , :string, null:false
      t.change :resource_id, :integer,null:false
      
    end
  end
end
  
  