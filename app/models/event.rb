class Event < ApplicationRecord
  belongs_to :hobby
  has_many :bookings
  has_many :users, through: :bookings
end
