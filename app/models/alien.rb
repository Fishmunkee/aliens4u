class Alien < ApplicationRecord
  attr_accessor :rating

  belongs_to :user
end
