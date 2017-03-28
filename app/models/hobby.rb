class Hobby < ApplicationRecord
  has_attachments :photos, maximum: 5

  belongs_to :user
  has_many :events
  has_many :hobby_categories

  validates :title, presence: true
  validates :description, presence: true
  validates :summary, presence: true
  validates :address, presence: true
end
