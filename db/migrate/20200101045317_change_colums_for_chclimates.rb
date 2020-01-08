class ChangeColumsForChclimates < ActiveRecord::Migration[5.2]
  def change
   rename_column :chclimates,:temp,:temp_ave
   rename_column :chclimates,:rain,:rain_total
   add_column :chclimates,:max_temp,:float
   add_column :chclimates,:max_temp_month, :integer
   add_column :chclimates,:min_temp, :float
   add_column :chclimates,:min_temp_month, :integer
  end
end
