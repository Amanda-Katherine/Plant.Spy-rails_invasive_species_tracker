class CreatePostEnvironments < ActiveRecord::Migration[6.0]
  def change
    create_table :post_environments do |t|
      t.integer :post_id
      t.integer :environment_id

      t.timestamps
    end
  end
end
