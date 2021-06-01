class BookingsController < ApplicationController

  def index
    @bookings = Booking.all
  end 

  def new
    @booking = Booking.new
    @furnishing = Furnishing.find(params[:id])
  end 
  
  def create
    @booking = Booking.new(booking_params)
    # @furnishing = Furnishing.find(params[:id])
    @booking.user_id = current_user.id
    @booking.furnishing_id = params[:furnishing_id]

    if booking.save
      redirect_do user_path
    else
      render :new
    end
  end 

  def edit
    @booking = Booking.find(params[:id])
  end 
  
  # def update
  #   @booking = Booking.find(params[:id])
  #   if booking.update(booking_params)
  #     redirect_to user_path notice: "Your booking was successfully added"
  #   else
  #     render :edit
  #   end 
  # end 

  # def destroy
  #   @booking = Booking.find(params[:id])
  #   @booking.destroy
  #   redirect_to user_path notice: "Your booking was successfully deleted"
  # end 

  private

  def booking_params
    params.require(:booking).permit(:start_date, :end_date, :furnishing_id, :user_id)
  end 

end
