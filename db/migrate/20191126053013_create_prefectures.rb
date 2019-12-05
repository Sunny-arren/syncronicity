class CreatePrefectures < ActiveRecord::Migration[5.2]
  def change
    create_table :prefectures do |t|
      t.string "name", null: false
      t.string "simplified"
      t.timestamps
    end
  end
end
