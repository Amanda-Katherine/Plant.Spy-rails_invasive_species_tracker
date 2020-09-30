class User < ApplicationRecord
    has_many :posts
    has_many :invasive_species, through: :posts

    validates :name, :username, :email, presence: true, on: :create
    validates :email, presence: true, on: 'sessions#login_via_omniauth'
    validates :username, :email, uniqueness: true 

    
    has_secure_password
end

