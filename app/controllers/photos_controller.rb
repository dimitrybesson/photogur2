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
      redirect_to photos_url
      #render :index # Render simply displays the index page, it does not do a new get request to /photos, and thus the photos#index method is never executed, and there is no @photos for the index.html.erb page to work with
    else
      render :new
    end
  end

  private
  def photo_params
    params.require(:photo).permit(:artist, :title, :url)
  end

end
