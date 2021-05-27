class Admin < ApplicationRecord
    before_save { email.downcase! }
    VALID_EMAIL = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
    validates :email, presence: true, length: {maximum: 255}, format: { with: VALID_EMAIL }, uniqueness: true
    validates :password, presence: true, length: {minimum: 4}
    has_secure_password

    #returns the hash digest of given string
    def Student.digest(string)
        cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST : BCrypt::Engine.cost
        BCrpyt::Password.create(string, cost: cost)
    end
end
