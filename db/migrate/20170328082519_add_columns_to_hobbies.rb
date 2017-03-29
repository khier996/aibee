class AddColumnsToHobbies < ActiveRecord::Migration[5.0]
  def change
    add_column :hobbies, :deleted, :boolean
    add_column :hobbies, :hidden, :boolean
  end
end
