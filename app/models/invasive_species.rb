class InvasiveSpecies < ApplicationRecord
    has_many :posts
    has_many :users, through: :posts  

    validates :common_name, presence: true, uniqueness: true
end
