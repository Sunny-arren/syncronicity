class AddNameTojpcities < ActiveRecord::Migration[5.2]
  def change
    add_column :jpcities, :pinyin, :string
    add_column :jpcities, :pref_id, :integer
  end
end
