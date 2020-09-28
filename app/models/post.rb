class Post < ApplicationRecord
    belongs_to :invasive_species
    belongs_to :user
end
