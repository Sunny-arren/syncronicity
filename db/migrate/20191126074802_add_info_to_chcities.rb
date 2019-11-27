class AddInfoToChcities < ActiveRecord::Migration[5.2]
  def change
    add_column :chcities, :jpkanji, :string
    add_column :chcities, :hira, :string
    add_column :chcities, :simplified, :string
    add_column :chcities, :pinyin, :string
    add_column :chcities, :prov_id, :integer
  end
end
