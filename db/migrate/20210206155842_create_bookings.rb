class CreateBookings < ActiveRecord::Migration[6.0]
  def change
    create_table :bookings do |t|
      t.datetime :appointment_start_date
      t.datetime :appointment_end_date
      t.datetime :date_posted
      t.references :user, null: false, foreign_key: true
      t.references :alien, null: false, foreign_key: true

      t.timestamps
    end
  end
end
