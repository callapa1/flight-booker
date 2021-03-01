class BookingMailer < ApplicationMailer
  default from: "lopezcallapa@gmail.com"

  def booking_confirmation(passenger)
    @passenger = passenger
    @greeting = "hi"
    mail to: @passenger.email, subject: "Booking Confirmation"
  end
end