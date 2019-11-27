class AddColumnToJpcity2 < ActiveRecord::Migration[5.2]
  def change
   add_column :jpcity2s, :jpcity_id, :integer
  end
end
