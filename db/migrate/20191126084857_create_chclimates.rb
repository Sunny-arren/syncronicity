class CreateChclimates < ActiveRecord::Migration[5.2]
  def change
    create_table :chclimates do |t|
      t.integer "chcity_id", null: false
      t.integer "temp", null: false
      t.integer "rain", null: false
      t.integer "warmin"
      t.integer "cldiv_id"
      t.timestamps
    end
  end
end
