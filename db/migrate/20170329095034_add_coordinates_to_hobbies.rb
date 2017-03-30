class AddCoordinatesToHobbies < ActiveRecord::Migration[5.0]
  def change
    add_column :hobbies, :latitude, :float
    add_column :hobbies, :longitude, :float
  end
end
