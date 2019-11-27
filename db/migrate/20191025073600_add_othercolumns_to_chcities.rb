class AddOthercolumnsToChcities < ActiveRecord::Migration[5.2]
  def change
    add_column :chcities, :name_ch, :string
    add_column :chcities, :name_sim, :string
    add_column :chcities, :prov_sim, :string
  end
end
