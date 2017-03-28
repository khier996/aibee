class AddColumnsToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :first_name, :string, null: false
    add_column :users, :last_name, :string, null: false
    add_column :users, :bio, :text
    add_column :users, :gender, :string
    add_column :users, :phone_number, :string
    add_column :users, :birthdate, :date
    add_column :users, :admin, :boolean, default: false
  end
end
