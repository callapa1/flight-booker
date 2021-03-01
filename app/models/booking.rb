class Booking < ApplicationRecord
  has_many :passengers
  belongs_to :flight

  def passengers_attributes=(passengers_attributes)
    # passengers_attributes = [
    #     {:name => "Cristian Lopez", :email => "lopezcallapa@gmail.com"},
    #     {:name => "Evelia Karlsson", :email => "evelina.karlsson18@gmail.com"}
    # ]
    passengers_attributes.each do |i, passenger_attributes|
      # wanna create a passenger for this Booking with these attributes
      self.passengers.build(passenger_attributes)
    end
  end
end
