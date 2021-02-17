class Kind < ApplicationRecord
  has_many :kind_assignments
  has_many :reservations, through: :kind_assignments

end
