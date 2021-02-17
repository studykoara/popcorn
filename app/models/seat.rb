class Seat < ApplicationRecord
  has_many :performances_seats
  has_many :performances, through: :performances_seats
  has_many :seat_assignments
  has_many :seats, through: :seat_assignments
end
