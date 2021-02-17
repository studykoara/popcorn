class Member < ApplicationRecord
  has_secure_password
  has_many :reservations

  validates :name, presence: true,
    format: {
      with: /\A[A-Za-z][A-Za-z0-9]*\z/,  # 半角英数のみ
      allow_blank: true,                 # 空を禁止
      message: :invalid_member_name
    },
    length: { minimum: 2, maximum: 20, allow_blank: true }, # 2以上20以下の文字数
    uniqueness: { case_sensitive: false } # 大文字小文字区別しないで重複禁止
  validates :full_name, presence: true, length: { maximum: 20 } # 空禁止,20文字以下
  validates :birthday, presence: true
  validates :mail, email: { allow_blank: true }

  attr_accessor :current_password
  validates :password, presence: { if: :current_password }

  validate :after_today
  def after_today
    errors.add(:birthday, "can't be after today") if birthday.nil? || birthday > Date.today
  end

  # validate :before_today
  # def before_today
  #   errors.add(:expiration, "can't before this month") if expiration.nil? || expiration < Date.today
  # end

  validates :credit_number,
    format: {
      with: /\A\d{14,16}\z/,  # 半角数字のみ
      allow_blank: true    # 空を禁止
    }
  
  validates :authentication_number,
    format: {
      with: /\A\d{1,4}\z/,  # 半角数字のみ
      allow_blank: true    # 空を禁止
    }
  
  class << self
    def search(query)
      rel = order(:member_id)
      if query.present?
        rel = rel.where("name LIKE ? OR full_name LIKE ?",
          "%#{query}%", "%#{query}%")
      end
      rel
    end
  end

end
