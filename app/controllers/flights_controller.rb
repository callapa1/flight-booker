class FlightsController < ApplicationController
  def index
    @flights = Flight.all
    if params[:search].present?
      @code = params[:search][:code].upcase
      @from = params[:search][:from_airport_id]
      @to = params[:search][:to_airport_id]
      if params[:search][:date] != ''
        @flights = Flight.where("cast(date as DATE) = ? ", params[:search][:date] )
      else
        @flights = Flight.where("code = ? OR (from_airport_id = ? AND to_airport_id = ?)", @code, @from, @to)
      end
      @booking = Booking.new
    end
  end
end