class User < ApplicationRecord
    has_many :posts
    has_many :invasive_species, through: :posts

    validates :name, :username, :
    has_secure_password
end

