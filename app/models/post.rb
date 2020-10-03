class Post < ApplicationRecord
    has_many :posts_environments
    has_many :environments, through: :post_environments
    belongs_to :invasive_species
    belongs_to :user

    validates :description, :location_latitude, :location_longitude, :user_id, :invasive_species_id, presence: true

    def invasive_species_attributes=(inv_spec_atts)
        binding.pry
        inv_spec = InvasiveSpecies.find_or_create_by(common_name: inv_spec_atts[:common_name])

        self.invasive_species = inv_spec
    end
end
