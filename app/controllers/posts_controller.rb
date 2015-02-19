class PostsController < ApplicationController
  require 'pry'

  def index
    @posts = Post.all 
  end

  def show
    #pry.binding
    #@event = Event.find(current_user)
    @user = User.find(current_user)
    @post = Post.find(params[:id])
    
    
  end

  # def postingevent
  #   @post_event = Post.new
  #   @post_event.user_id = current_user.id 
  #   @post_event.event_id = params[:id]
  #   @post_event.save
  #   redirect_to post_path


   # @new_attendee = UsersEvent.new 
   #  @new_attendee.user_id = current_user.id 
   #  @new_attendee.event_id = params[:id]
   #  @new_attendee.save
   #  redirect_to event_path
  # end


  def new
    @post = Post.new
  end

  def create
    #pry.binding

    @user = User.find(current_user)
    @post = @user.posts.new(posts_params)
    @post.event_id = params[:event_id] #Entering event_id to Post table event_id.
    if @post.save
      #redirect_to event_path(params[:event_id])
      redirect_to event_path(@post.event_id)
    else
      render :new
    end
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    if @post.update_attributes(posts_params)
      redirect_to post_path 
    else
      render 'edit'
    end
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to posts_path
  end

  private
  def posts_params
    params.require(:post).permit(:title, :body, :event_id)
  end
end
