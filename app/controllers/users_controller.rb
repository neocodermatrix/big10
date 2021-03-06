class UsersController < ApplicationController

before_action :authorize?, only: :edit 


  def index
    @users = User.all

  end

  def show
    @user = User.find(params[:id])
    @user_attending = @user.events_attending
    @user_posting = @user.posts
    @requests = Friendship.where(user_id: @user.id)
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id.to_s
      #this creates a session with the user that just signed up
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
      #render "Edit" 
      render :edit
    end
  end

  def destroy
    # @user = User.find(params[:id])
    # @user.destroy
    # redirect_to users_path
    @user = User.find(params[:id])
    if(params[:id] == session[:user_id])
      session.delete(:user_id)
    end
    @user.destroy
    redirect_to users_path
  end

private
  
  def user_params
    params.require(:user).permit(:name, :email, :address, :city, :state, :zip, :password, :password_confirmation, :image)
  end

  def authorize?
    user = User.find(params[:id])
    if current_user != user
      redirect_to users_path
    end
  end

end







