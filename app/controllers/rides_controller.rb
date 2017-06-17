class RidesController < ApplicationController
  def create
    user = User.find_by(id: params[:user_id])
    new_ride = Ride.create(user_id: params[:user_id], attraction_id: params[:attraction_id])
    message = new_ride.take_ride
    redirect_to user, notice: message
  end
end
