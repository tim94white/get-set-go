class BookingsController < ApplicationController

  def new
    @booking = Booking.new
    @furnishing = Furnishing.find(params[:furnishing_id])
  end 
  
  def create
    # raise
    @booking = Booking.new(booking_params)
    @furnishing = Furnishing.find(params[:furnishing_id])

    @booking.user_id = current_user.id
    @booking.furnishing_id = params[:furnishing_id]    
    # @booking.furnishing = @furnishing # ASK THIS!!

    if @booking.save
      redirect_to user_path(current_user)
    else
      render :new
    end
  end 

  def edit
    @booking = Booking.find(params[:id])
  end 
  
  def update
    @booking = Booking.find(params[:id])
    if booking.update(booking_params)
      redirect_to user_path(@user) # notice: "Your booking was successfully added"
    else
      render :edit
    end 
  end 

  def destroy
    @booking = Booking.find(params[:id])
    @booking.destroy
    redirect_to user_path(@user) # notice: "Your booking was successfully deleted"
  end 

  private

  def booking_params
    params.require(:booking).permit(:start_date, :end_date)
    # params.require(:booking).permit(:start_date, :end_date, :furnishing_id, :user_id)
  end 

end
