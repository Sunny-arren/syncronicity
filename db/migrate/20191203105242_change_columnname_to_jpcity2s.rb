class ChangeColumnnameToJpcity2s < ActiveRecord::Migration[5.2]
  def change
    change_column :jpcity2s, :pref, :string
  end
end
