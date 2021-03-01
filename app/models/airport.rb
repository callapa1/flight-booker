class Airport < ApplicationRecord
  validates :name, length: { is: 3 }, uniqueness: true

  # active => airport as start
  has_many :departing_flights, class_name: "Flight", foreign_key: :from_airport_id

  # passive => airport as destination
  has_many :arriving_flights, class_name: "Flight", foreign_key: :to_airport_id
end