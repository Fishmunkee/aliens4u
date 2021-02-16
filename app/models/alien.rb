class Alien < ApplicationRecord
  attr_accessor :rating
  has_one_attached :photo
  belongs_to :user

  validates :name, :species, :planet, presence: true
  validates :name, uniqueness: true
end
