class AddItemToChcity2s < ActiveRecord::Migration[5.2]
  def change
    change_column :chcity2s, :lati, :float, null:false
    change_column :chcity2s, :longi, :float, null:false
  end
end
