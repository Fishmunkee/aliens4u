class CreateAliens < ActiveRecord::Migration[6.0]
  def change
    create_table :aliens do |t|
      t.string :name
      t.string :species
      t.string :planet
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
