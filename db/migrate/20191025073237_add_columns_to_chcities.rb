class AddColumnsToChcities < ActiveRecord::Migration[5.2]
  def change
    add_column :chcities, :prov_ch, :string
    add_column :chcities, :temp, :integer
    add_column :chcities, :precip, :integer
  end
end
