class UsersController < ApplicationController
  before_action :require_signin, only: [:show]
  before_action :set_user!, only: [:show]

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      session[:user_id] = @user.id
      redirect_to user_path(@user)
    else
      render :new
    end
  end

  def show
  end

  private
    def user_params
      params.require(:user).permit(:name, :password, :height, :happiness, :nausea, :tickets, :admin)
    end

    def set_user!
      @user = User.find(params[:id])
    end

    def require_signin
      return redirect_to root_path, alert: "You must be logged in first." unless logged_in?
    end
end
