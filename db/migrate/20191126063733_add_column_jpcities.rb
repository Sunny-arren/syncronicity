class AddColumnJpcities < ActiveRecord::Migration[5.2]
  def up
  end
  def down
    remove_column :jpcities, :name, :string
    remove_column :jpcities, :pref, :string
    remove_column :jpcities, :simplified, :string
    remove_column :jpcities, :chinese, :string
    remove_column :jpcities, :temp, :string
    remove_column :jpcities, :precip, :string
    remove_column :jpcities, :latitude, :string
    remove_column :jpcities, :population, :string
    remove_column :jpcities, :size, :string  
  end
end
