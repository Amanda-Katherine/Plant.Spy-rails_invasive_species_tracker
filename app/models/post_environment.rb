class PostEnvironment < ApplicationRecord
    belongs_to :post
    belongs_to :environment
end
