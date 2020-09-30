class User < ApplicationRecord
    has_many :posts
    has_many :invasive_species, through: :posts

    validates :name, :username, presence: true, on: :create
    validates :email, presence: true, on: 'sessions#login_via_omniauth'
    validates :username, uniqueness: true, on: :create
    validates :email, uniqueness: true, on: 'sessions#login_via_omniauth'


    
    has_secure_password
end

