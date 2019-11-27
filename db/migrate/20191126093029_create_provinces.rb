class CreateProvinces < ActiveRecord::Migration[5.2]
  def change
    create_table :provinces do |t|
      t.string :jpkanji, null:false
      t.string :simplified, null:false
      t.string :pinyin, null:false
      t.timestamps
    end
  end
end
