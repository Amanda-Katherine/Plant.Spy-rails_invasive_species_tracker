class CreatePosts < ActiveRecord::Migration[6.0]
  def change
    create_table :posts do |t|
      t.string :species_name
      t.string :description
      t.string :location_latitude
      t.string :location_longitude
      t.string :photo
      t.integer :invasive_species_id
      t.integer :user_id

      t.timestamps
    end
  end
end
