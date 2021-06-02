class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @furnishings = @user.furnishings
    @bookings = @user.bookings
  end


end
