class CreateListings < ActiveRecord::Migration[7.0]
  def change
    create_table :listings do |t|
      t.string :name
      t.float :rating
      t.text :description
      t.string :short_description
      t.string :location
      t.integer :price
      t.integer :duration
      t.integer :capacity
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
