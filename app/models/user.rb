class User < ApplicationRecord
  has_secure_password

  PASSWORD_REQUIREMENTS = /\A
    (?=.{10,})
    (?=.*\d{2,})
    (?=.*[a-z]{2,})
    (?=.*[A-Z]{2,})
    (?=.*[[:^alnum:]]{2,})
  /x

  validates :name, presence: true, length: { in: 5..128 }
  validates :email, presence: true, format: { with: URI::MailTo::EMAIL_REGEXP },
            uniqueness: { case_sensitive: false },
            length: { maximum: 64 }
  validates :password, presence: true, format: { with: PASSWORD_REQUIREMENTS,
            message: "Should have a minimum of 10 characters. Including at least 2 uppercase, 2 lowercase, 2 numbers and 2 special character." },
            length: { in: 10..128 }
  validates :password_confirmation, presence: true,
            length: { in: 10..128 }
end
