class CreateListings < ActiveRecord::Migration[5.0]
  def change
    create_table :listings do |t|
      t.integer :price
      t.string :home_title
      t.text :summary
      t.string :address
      t.string :home_type
      t.string :room_type
      t.integer :bedroom
      t.integer :bathroom
      t.integer :accomodate
      t.boolean :got_tv
      t.boolean :got_kitchen
      t.boolean :got_aircond
      t.boolean :got_internet
      t.boolean :got_gym
      t.boolean :got_pool
      t.boolean :active

      t.references :user, index: true, foreign_key: true
      t.timestamps
    end
  end
end
