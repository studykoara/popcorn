class SeatAssignment < ApplicationRecord
  belongs_to :seat
  belongs_to :reservation
end
