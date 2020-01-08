class AddJpkanjiColumn < ActiveRecord::Migration[5.2]
  def change
    add_column :jpcity2s,:jpkanji,:string
    add_column :chcity2s,:jpkanji,:string
  end
end
