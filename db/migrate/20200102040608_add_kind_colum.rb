class AddKindColum < ActiveRecord::Migration[5.2]
  def change
    add_column :jpcities,:kind,:string
    add_column :chcities,:kind,:string 
  end
end
