class User < ApplicationRecord
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i

  # オブジェクトが保存される時点で処理するメソッド:before_save
  # ActiveRecordのCallbackMethod
  before_save do
    self.email = email.downcase
  end

  validates :name,  presence: true, length: { maximum: 50 }

  # emailのバリデーション
  # case_sensitiveは大文字小文字の違いを確認する制約であり、大文字小文字は不問としている
  validates :email, presence: true, length: { maximum: 255 },
                    format: { with: VALID_EMAIL_REGEX },
                    uniqueness: { case_sensitive: false }

  has_secure_password
  validates :password, presence: true, length: { minimum: 6 }
end
