class AddReviewCountToHobby < ActiveRecord::Migration[5.0]
  def change
    add_column :hobbies, :review_count, :integer
  end
end
