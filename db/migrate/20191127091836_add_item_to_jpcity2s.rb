class AddItemToJpcity2s < ActiveRecord::Migration[5.2]
  def change
    change_column :jpcity2s, :lati, :float, null:false
    change_column :jpcity2s, :longi, :float, null:false
  end
end
