class Environment < ApplicationRecord
    has_many :posts_environments
    has_many :posts, through: :post_environments
end
