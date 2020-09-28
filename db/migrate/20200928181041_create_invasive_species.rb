class CreateInvasiveSpecies < ActiveRecord::Migration[6.0]
  def change
    create_table :invasive_species do |t|
      t.string :common_name
      t.string :photo
      t.string :description

      t.timestamps
    end
  end
end
