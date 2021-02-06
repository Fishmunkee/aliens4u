class CreateAliens < ActiveRecord::Migration[6.0]
  def change
    create_table :aliens do |t|
      t.string :name
      t.string :species
      t.string :planet
      t.Integer :rating

      t.timestamps
    end
  end
end
