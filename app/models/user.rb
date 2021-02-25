class User < ActiveRecord::Base
    validates :username, :email, :password, presence: true
    validates :email, uniqueness: true
    has_secure_password
    has_many :movies
end