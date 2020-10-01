class Post < ApplicationRecord
    has_many :post_environments
    has_many :environments, through: :post_environments
    belongs_to :invasive_species
    belongs_to :user
end
