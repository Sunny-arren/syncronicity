class CreateLatitudes < ActiveRecord::Migration[5.2]
  def change
    create_table :latitudes do |t|
      t.float "lat_min"
      t.float "lat_max" 
      t.timestamps
    end
  end
end
