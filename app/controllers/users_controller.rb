class UsersController < ApplicationController
  before_action :current_user, only: [:show]
  def index
    @users = User.all
    render :index
  end

  def new
    # we make a new user
    # to pass to the form view later
    @user = User.new
    render :new
  end


  def create
    @user = User.create(user_params)
    login(@user) # <-- log the user in
    redirect_to @user # <-- go to show
  end

  def show
    @user = User.find_by_id(params[:id])
    render :show
  end

  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :password)
  end
end
