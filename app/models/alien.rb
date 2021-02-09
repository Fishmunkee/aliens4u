class Alien < ApplicationRecord
  attr_accessor :rating

  belongs_to :user

  validates :name, :species,. :planet, presence: true
  validates :name, uniqueness: true
end
