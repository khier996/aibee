class CreateHobbies < ActiveRecord::Migration[5.0]
  def change
    create_table :hobbies do |t|
      t.references :user, foreign_key: true
      t.string :title
      t.integer :likes
      t.text :description
      t.string :summary
      t.integer :average_score
      t.string :address

      t.timestamps
    end
  end
end
