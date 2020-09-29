class User < ApplicationRecord
    has_many :posts
    has_many :invasive_species, through: :posts

    validates :name, :username, :about_me, :password, :location, presence: true, on: :create
    validates :username, :password, presence: true#, on: login 
    has_secure_password
end

