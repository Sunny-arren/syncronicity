class CreateJpclimates < ActiveRecord::Migration[5.2]
  def change
    create_table :jpclimates do |t|
      t.integer "jpcity_id", null: false
      t.integer "temp", null: false
      t.integer "rain", null: false
      t.integer "warmin"
      t.integer "cldiv_id"
    end
  end
end