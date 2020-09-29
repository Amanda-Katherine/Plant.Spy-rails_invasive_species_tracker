class User < ApplicationRecord
    has_many :posts
    has_many :invasive_species, through: :posts

    validates :name, :username, :about_me, :password, :location, presence: true
    has_secure_password
end

