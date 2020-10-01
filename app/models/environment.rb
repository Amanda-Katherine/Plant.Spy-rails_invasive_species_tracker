class Environment < ApplicationRecord
    has_many :post_environments
    has_many :posts, through: :post_environments
end
