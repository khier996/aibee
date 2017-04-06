class Hobby < ApplicationRecord
  acts_as_votable

  has_attachments :photos, maximum: 5
  has_attachment :qr_code

  belongs_to :user
  has_many :events
  has_many :hobby_categories
  has_many :categories, through: :hobby_categories
  has_many :bookings, through: :events

  validates :title, presence: true
  validates :description, presence: true
  validates :summary, presence: true
  validates :address, presence: true
  validates :photos, presence: true

  geocoded_by :address
  after_validation :geocode, if: :address_changed?
end

