class ChangePropertyChcitiesProvid < ActiveRecord::Migration[5.2]
  def change
    remove_column :chcities, :prov_id, :string
    add_reference :chcities, :province, foreign_key: true
  end
end
