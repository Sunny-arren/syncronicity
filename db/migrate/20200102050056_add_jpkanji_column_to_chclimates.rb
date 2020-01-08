class AddJpkanjiColumnToChclimates < ActiveRecord::Migration[5.2]
  def change
    add_column :chclimates,:jpkanji,:string 
  end
end
