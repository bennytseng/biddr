class User < ApplicationRecord
  has_secure_password

  VALID_EMAIL_REGEX = /\A([\w+\-]\.?)+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i
  validates :email, presence:   true,
                  uniqueness: {case_sensitive: false},
                  format:     VALID_EMAIL_REGEX

end
