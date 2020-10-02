class Post < ApplicationRecord
    has_many :posts_environments
    has_many :environments, through: :post_environments
    belongs_to :invasive_species
    belongs_to :user

    validates :description, :location_latitude, :location_longitude, :user_id, :invasive_species_id, presence: true

    # accepts_nested_attributes_for :invasive_species

    #insert custom nested form for invasive species? 
    def invasive_species_attributes=(inv_spec_atts)
        inv_spec = InvasiveSpecies.find_or_create_by(common_name: inv_spec_atts[:common_name])

        if inv_spec[:id].present?
            self.invasive_species = inv_spec
        else 
            self.build_invasive_species(common_name: inv_spec_atts[:common_name, description: self.description])
        end
    end

    #insert custom nestest attribute for environment to find Environment.all options. 
end
