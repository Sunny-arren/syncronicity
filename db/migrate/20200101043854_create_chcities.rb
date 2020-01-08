class CreateChcities < ActiveRecord::Migration[5.2]
  def change
    create_table :chcities do |t|
      t.string "jpkanji", null: false
      t.string "hira"
      t.string "simplified", null: false
      t.string "pinyin", null: false
      t.string "prov"
      t.float "latitude"
      t.float "longitude" 
      t.timestamps
    end
  end
end
