class AddOthersToChcities < ActiveRecord::Migration[5.2]
  def change
    add_column :chcities, :latitude, :integer
    add_column :chcities, :population, :integer
    add_column :chcities, :size, :integer
  end
end
