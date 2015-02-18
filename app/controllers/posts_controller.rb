class PostsController < ApplicationController
  def index
    @posts = Post.all 
  end

  def show
    @user = User.find(current_user)
    @post = Post.find(params[:id])
    #binding.pry
  end

  def new
    @post = Post.new
  end

  def create
    @user = User.find(current_user)
    @post = @user.posts.new(posts_params)
    if @post.save
      redirect_to posts_path
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
    params.require(:post).permit(:title, :body)
  end
end
