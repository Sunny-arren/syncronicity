class AddColumnToPrefectures < ActiveRecord::Migration[5.2]
  def change
    add_column :prefectures, :sim_name, :string
  end
end
