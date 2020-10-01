class Post < ApplicationRecord
    has_many :posts_environments
    has_many :environments, through: :post_environments
    belongs_to :invasive_species
    belongs_to :user

    accepts_nested_attributes_for :invasive_species
end
