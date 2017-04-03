class Category < ApplicationRecord
  has_many :hobby_categories
  has_many :hobbies, through: :hobby_categories

end
