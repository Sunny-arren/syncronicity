class AddColumnToChcity2 < ActiveRecord::Migration[5.2]
  def change
    add_column :chcity2s, :chcity_id, :integer
  end
end
