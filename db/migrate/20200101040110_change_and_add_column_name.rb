class ChangeAndAddColumnName < ActiveRecord::Migration[5.2]
  def change
   rename_column :jpcity2s,:latitude,:lati
   rename_column :jpcity2s,:longitude,:longi
   rename_column :chcity2s,:latitude,:lati
   rename_column :chcity2s,:longitude,:longi
   change_column :chcity2s,:prov,:string,null: true
   change_column :chcity2s,:size,:float
   change_column :chcity2s,:dense,:float
   change_column :jpcity2s,:size,:float
   change_column :jpcity2s,:dense,:float
   change_column :jpcity2s,:pref,:string,null: true
   add_column :jpcity2s,:latitude_id,:integer
   add_column :chcity2s,:latitude_id,:integer
  end
end
