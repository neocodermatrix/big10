class UsersController < ApplicationController

before_action :authorize?, only: :edit 


  def index
    @users = User.all

  end

  def show
    @user = User.find(params[:id])
    @event = Event.find(params[:id])
    # @event1 = UsersEvent.where({
    #   event_id: params[:id],
    #   user_id: current_user.id
    #   })
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id.to_s
      #this creates a session with the user that just signed up7
      redirect_to users_path
    else
      render :new
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update_attributes(user_params)
      redirect_to user_path(@user)
    else
      render "Edit"
    end
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    redirect_to users_path
  end

private
  
  def user_params
    params.require(:user).permit(:name, :email, :address, :city, :state, :zip, :password, :password_confirmation)
  end

  def authorize?
    user = User.find(params[:id])
    if current_user != user
      redirect_to users_path
    end
  end

end
