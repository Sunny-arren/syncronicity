class AddColumnsToJpcities < ActiveRecord::Migration[5.2]
  def change
    add_column :jpcities, :chinese, :string
    add_column :jpcities, :temp, :integer
    add_column :jpcities, :precip, :integer
  end
end
