class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :alien
  validates :appointment_start_date, presence: true
  validates :appointment_end_date, presence: true
end
