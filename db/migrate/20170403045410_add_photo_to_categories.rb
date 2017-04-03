class AddPhotoToCategories < ActiveRecord::Migration[5.0]
  def change
    add_column :categories, :photo_url, :string
  end
end
