class Booking < ApplicationRecord
  has_many :passengers
  belongs_to :flight

  def passengers_attributes=(passengers_attributes)
    passengers_attributes.each do |i, passenger_attributes|
      self.passengers.build(passenger_attributes)
    end
  end
end
