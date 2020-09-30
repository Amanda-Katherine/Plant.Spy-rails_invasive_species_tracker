class User < ApplicationRecord
    has_many :posts
    has_many :invasive_species, through: :posts

    validates :name, :username, :email, presence: true, on: 'users#create'
    validates :username, :email, presence: true, on: 'sessions#login_via_account'
    validates :email, presence: true, on: 'sessions#login_via_omniauth'
    validates :username, uniqueness: true 
    
    has_secure_password
end

