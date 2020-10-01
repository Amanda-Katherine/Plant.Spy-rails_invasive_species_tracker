class RemoveEnvironmentFromInvasiveSpecies < ActiveRecord::Migration[6.0]
  def change
    remove_column :invasive_species, :environment, :string
  end
end
