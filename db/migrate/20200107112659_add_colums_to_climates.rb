class AddColumsToClimates < ActiveRecord::Migration[5.2]
  def change
    add_column :chclimates,:middle_temp,:float
    add_column :jpclimates,:middle_temp,:float
  end
end
