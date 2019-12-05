class DestroyChcity < ActiveRecord::Migration[5.2]
  def change
    drop_table :chcities
  end
end
