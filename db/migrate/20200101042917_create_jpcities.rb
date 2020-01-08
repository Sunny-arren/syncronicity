class CreateJpcities < ActiveRecord::Migration[5.2]
  def change
    create_table :jpcities do |t|
      t.string "pref", null: false
      t.string "jpkanji", null: false
      t.string "simplified", null: false
      t.string "hira", null: false
      t.string "alphabet", null: false
      t.string "pinyin"
      t.float "latitude"
      t.float "longitude" 
      t.timestamps
    end
  end
end
