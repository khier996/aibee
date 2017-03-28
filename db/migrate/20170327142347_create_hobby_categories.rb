class CreateHobbyCategories < ActiveRecord::Migration[5.0]
  def change
    create_table :hobby_categories do |t|
      t.references :category, foreign_key: true
      t.references :hobby, foreign_key: true

      t.timestamps
    end
  end
end
