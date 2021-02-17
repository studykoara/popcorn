class Movie < ApplicationRecord
  has_many :performances

  validates :title, presence: true,
    length: { minimum: 1, maximum: 20 } # 1以上20以下の文字数
  validates :story, presence: true # 空禁止
  validates :release_date, presence: true
  validate :before_today
  def before_today
    errors.add(:release_date, "can't before today") if release_date.nil? || release_date < Date.today
  end
  validates :running_time, presence: true,
    :numericality => { :greater_than => 0 }
  validates :director, presence: true,
    length: { minimum: 1, maximum: 20 } # 1以上20以下の文字数
  validates :actor, presence: true,
    length: { minimum: 1, maximum: 100 } # 1以上100以下の文字数

  class << self
    def search(query)
      rel = order(:movie_id)
      if query.present?
        rel = rel.where("title LIKE ? OR story LIKE ? OR distribution LIKE ? OR director LIKE ? OR actor LIKE ?",
          "%#{query}%", "%#{query}%", "%#{query}%", "%#{query}%", "%#{query}%")
      end
      rel
    end
  end
  # scope :search_performance, ->(query) {where("performances.screening_date = ?", query)}
  # def search_performance(query)
  #   rel = order(:movie_id)
  #   if query.present?
  #     rel = Movie.search_performance(query)
  #   end
  #   rel
  # end

  
end
