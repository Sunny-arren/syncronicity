class CreateJpcity2s < ActiveRecord::Migration[5.2]
  def change
    create_table :jpcity2s do |t|
      t.integer :lati, null: false
      t.integer :longi, null:false
      t.integer :pref_id, null:false
      t.integer :popul, null:false
      t.integer :size, null:false
      t.integer :dens, null:false
      t.integer :income
      t.integer :r_price
      t.timestamps
    end
  end
end
