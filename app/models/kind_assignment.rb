class KindAssignment < ApplicationRecord
  belongs_to :kind
  belongs_to :reservation
end
