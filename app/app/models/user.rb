class User < ApplicationRecord
    has_secure_token :token, length: 50
    validates :email, presence: true
    validates :password, length: { minimum: 5 }, if: -> { password.present? }
    validates :password_confirmation, length: { minimum: 5 }, if: -> { password.present? }
    has_secure_password
    has_many :articles
    has_one :profile, dependent: :destroy

    private

   # def password_present?
   #     false || password_present?
   # end
end
