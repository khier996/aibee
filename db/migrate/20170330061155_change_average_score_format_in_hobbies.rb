class ChangeAverageScoreFormatInHobbies < ActiveRecord::Migration[5.0]
  def change
    remove_column :hobbies, :average_score, :integer
    add_column :hobbies, :average_score, :float
  end
end
