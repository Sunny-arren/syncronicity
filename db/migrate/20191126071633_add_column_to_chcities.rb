class AddColumnToChcities < ActiveRecord::Migration[5.2]
  def change
    remove_column :chcities, :prov_ch, :string
    remove_column :chcities, :temp, :string
    remove_column :chcities, :precip, :string
    remove_column :chcities, :latitude, :string 
    remove_column :chcities, :population, :string
    remove_column :chcities, :size, :string
    remove_column :chcities, :name_ch, :string
    remove_column :chcities, :name_sim, :string
    remove_column :chcities, :prov_sim, :string
  end
end
