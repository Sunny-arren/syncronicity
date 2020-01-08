class CreateJpclimates < ActiveRecord::Migration[5.2]
  def change
    create_table :jpclimates do |t|
      t.integer "jpcity_id", null: false
      t.float "temp_ave"
      t.float "rain_total"
      t.integer "warmin"
      t.integer "cldiv_id"
      t.float "max_temp"
      t.integer "max_temp_month"
      t.float "min_temp"
      t.integer "min_temp_month"
      t.string "jpkanji"
      t.timestamps
    end
  end
end
    