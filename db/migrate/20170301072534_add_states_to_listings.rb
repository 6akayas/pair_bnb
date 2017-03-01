class AddStatesToListings < ActiveRecord::Migration[5.0]
  def change
    add_column :listings, :states, :string
  end
end
