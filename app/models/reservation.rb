class Reservation < ApplicationRecord
  belongs_to :meal
  belongs_to :user

  validates :timeslot, presence: true
end
