class AddOthersToJpcities < ActiveRecord::Migration[5.2]
  def change
    add_column :jpcities, :latitude, :integer
    add_column :jpcities, :population, :integer
    add_column :jpcities, :size, :integer
  end
end
