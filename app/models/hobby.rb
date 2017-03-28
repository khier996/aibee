class Hobby < ApplicationRecord
  belongs_to :user
  has_many :events
  has_many :hobby_categories

  validates :title, presence: true
  validates :description, presence: true
  validates :summary, presence: true
  validates :address, presence: true
end
