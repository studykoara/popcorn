class Reservation < ApplicationRecord
  belongs_to :member
  belongs_to :performance
  has_many :kind_assignments
  has_many :kinds, through: :kind_assignments
  has_many :seat_assignments
  has_many :seats, through: :seat_assignments
  
end
