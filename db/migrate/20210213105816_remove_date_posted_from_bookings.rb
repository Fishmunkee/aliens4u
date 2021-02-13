class RemoveDatePostedFromBookings < ActiveRecord::Migration[6.0]
  def change
    remove_column :bookings, :date_posted
  end
end
