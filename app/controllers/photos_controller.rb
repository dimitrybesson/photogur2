class PhotosController < ApplicationController
  def index
    @photos = Photo.all
  end

  def show
    @photo = Photo.find(params[:id])
  end

  def new
    # @photo = Photo.new
  end

  def create
    render :text => "Saving a photo. URL: #{params[:url]}, Title: #{params[:title]}, Artist: #{params[:artist]}"
  end
end
