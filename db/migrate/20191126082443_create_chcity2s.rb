class CreateChcity2s < ActiveRecord::Migration[5.2]
  def change
    create_table :chcity2s do |t|
      t.float "latitude", null: false
      t.float "longitude", null: false
      t.integer "prov", null: false
      t.integer "income"
      t.integer "r_price"
      t.integer "popul"
      t.integer "size"
      t.integer "dense"
      t.integer "chcity_id"
      t.timestamps
    end
  end
end
