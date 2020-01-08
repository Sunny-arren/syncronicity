class ChangeColumnsProperty < ActiveRecord::Migration[5.2]
  def change
   change_column :chcity2s, :popul, :float
   change_column :chcity2s, :r_price, :float
   change_column :jpcity2s, :popul, :float
   change_column :jpcity2s, :r_price, :float 
  end
end
