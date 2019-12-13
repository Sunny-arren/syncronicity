class AddLatitudeId < ActiveRecord::Migration[5.2]
  def change
    add_column :jpcity2s, :latitude_id, :integer
    add_column :chcity2s, :latitude_id, :integer
  end
end
