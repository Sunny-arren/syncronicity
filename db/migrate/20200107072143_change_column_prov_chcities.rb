class ChangeColumnProvChcities < ActiveRecord::Migration[5.2]
  def change
    rename_column :chcities, :prov, :prov_id
  end
end
