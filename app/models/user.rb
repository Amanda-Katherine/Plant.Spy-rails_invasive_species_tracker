class User < ApplicationRecord
    has_many :posts
    has_many :invasive_species, through: :posts

    has_secure_password
end

