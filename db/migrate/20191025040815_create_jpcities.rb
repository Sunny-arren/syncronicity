class CreateJpcities < ActiveRecord::Migration[5.2]
  def change
    create_table :jpcities do |t|

      t.timestamps
    end
  end
end
