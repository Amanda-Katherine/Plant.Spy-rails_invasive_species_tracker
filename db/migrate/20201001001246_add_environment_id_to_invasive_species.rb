class AddEnvironmentIdToInvasiveSpecies < ActiveRecord::Migration[6.0]
  def change
    add_column :invasive_species, :environment_id, :integer
  end
end
