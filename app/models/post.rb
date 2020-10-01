class Post < ApplicationRecord
    has_many :posts_environments
    has_many :environments, through: :post_environments
    belongs_to :invasive_species
    belongs_to :user

    accepts_nested_attributes_for :invasive_species

    # def invasive_species_attributes=(species_attributes)
    #     species_attributes.values.each do |species_attribute|
    #         if species_attribute[:common_name].present?
    #             species = InvasiveSpecies.find_or_create_by(species_attribute)
    #             self.posts.build(invasive_species: species)
    #             self.invasive_species << species
    #         end
    #     end
    # end
end
