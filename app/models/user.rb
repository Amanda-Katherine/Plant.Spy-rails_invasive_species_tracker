class User < ApplicationRecord
    has_many :posts
    has_many :invasive_species, through: :posts

    validates :name, :username, :email, :password, presence: true, on: :create
    validates :username, :password, presence: true#, on: login 
    validates :username, uniqueness: true 
    has_secure_password
end

