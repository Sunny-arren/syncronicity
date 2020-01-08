class AddColumnToClimates < ActiveRecord::Migration[5.2]
  def change
    add_column :chclimates,:snow_total,:integer
    add_column :jpclimates,:snow_total,:integer
  end
end
