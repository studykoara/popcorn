class Performance < ApplicationRecord
  belongs_to :movie
  has_many :performance_seats
  has_many :seats, through: :performance_seats
  has_many :reservations, dependent: :destroy
 
  validate :before_release_date
    def before_release_date
      @release_date = Movie.find(movie_id).release_date
      if screening_date < @release_date
        errors.add(:screening_date, "can't before release date")
      end
    end

  validate :before_release_date
    def before_release_date
      @release_date = Movie.find(movie_id).release_date
      if screening_date < @release_date
        errors.add(:screening_date, "can't before release date")
      end
    end

   validate :before_create_date
    def before_create_date
      errors.add(:screening_date, "can't before today") if screening_date.nil? || screening_date < Date.today
    end
    
end

