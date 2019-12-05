class DestroyJpcity < ActiveRecord::Migration[5.2]
  def change
    drop_table :jpcities
  end
end
