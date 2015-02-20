class PhotosController < ApplicationController
  def index
    @photos = Photo.all 
  end

  def show
    @photo = Photo.find(params[:id])
  end

  def new
    @photo = Photo.new
  end

  def create
    @photo = Photo.new(photo_params)
    if @photo.save
      redirect_to photo_path
    else
      render :new
    end
  end

  def edit
    @photo = Photo.find(params[:id])
  end

  def update
    @photo = Photo.find(params[:id])
    if @photo.update_attributes(photo_params)
      redirect_to photo_path(@photo)
    else
      render "Edit"
    end
  end

  def destroy
    @photo = Photo.find(params[:id])
    
  end
end
