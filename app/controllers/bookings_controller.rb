class BookingsController < ApplicationController
  def new
    @booking = Booking.new
    @booking.flight_id = params[:booking][:flight_id]
    @booking.seats = params[:booking][:seats]
    # empty values so they show up in the index screen
    @booking.passengers.build(:name => "", :email => "")
    @@hold = @booking
  end

  def create
    @booking = @@hold

    if @booking.seats > 4
      return redirect_to root_path
    end

    @booking.seats.times do |i|
      @booking.passengers.build(name: params[:booking][:passengers_attributes]["#{i}"][:name], email: params[:booking][:passengers_attributes]["#{i}"][:email])
    end
    # I delete the empty values. they're in first place
    # No DB space wasted
    @booking.passengers.first.delete

    if @booking.save
      @booking.passengers.each_with_index do |passenger, index|
        next if index == 0
        # BookingMailer.booking_confirmation(passenger).deliver
      end
      # Even if I clean the information, the 'slot' is still there (empty) and it has no id
      # so it needs to be skipped. This is not the best solution but it works
      redirect_to @booking
    else
      render :new
    end
  end

  def show
    @booking = Booking.find(params[:id])
  end

  private

  def booking_params
    # Nested params in passengers_attributes
    params.require(:booking).permit(:flight_id, :seats, :passengers_attributes => [:name, :email])
  end
end