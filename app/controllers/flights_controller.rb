class FlightsController < ApplicationController
  def index
    @flights = Flight.all
    if params[:search].present?
      @code = params[:search][:code]
      @from = params[:search][:from_airport_id]
      @to = params[:search][:to_airport_id]
      if params[:search][:date] != ''
        @date = params[:search][:date]
      end
      # inside where goes raw SQL
      @flights = Flight.where("code = ? OR (from_airport_id = ? AND to_airport_id = ?) OR date = ?", @code, @from, @to, @date)
      @booking = Booking.new
    end
  end
end