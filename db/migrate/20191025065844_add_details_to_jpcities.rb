class AddDetailsToJpcities < ActiveRecord::Migration[5.2]
  def change
    add_column :jpcities, :name, :string
    add_column :jpcities, :pref, :string
    add_column :jpcities, :simplified, :string
  end
end
