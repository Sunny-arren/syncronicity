class ChangePropertyForClimatesColums < ActiveRecord::Migration[5.2]
  def change
    change_column :chclimates,:temp_ave,:float,null:true
    change_column :chclimates,:rain_total,:float,null:true
  end
end
