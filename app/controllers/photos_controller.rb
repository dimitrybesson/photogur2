class PhotosController < ApplicationController
  def index
    #binding.pry
    @most_recent_photos = Photo.most_recent_five
    @created_before_photos = Photo.created_before(1.week.ago)
    if params[:search_value]
      @photos = Photo.where("title like ? or artist like ?", "%#{params[:search_value]}%", "%#{params[:search_value]}%")  
    else
      @photos = Photo.all
    end
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

  def edit
    @photo = Photo.find(params[:id])
  end

  def update
    @photo = Photo.find(params[:id])
    if @photo.update_attributes(photo_params)
      redirect_to "/photos/#{@photo.id}"
    else
      render :edit
    end
  end

  def destroy
    @photo = Photo.find(params[:id])
    @photo.destroy

    redirect_to photos_url
  end

#search based on full title of full author name
  # def search
  #   @search_results = Photo.all.select do |photo|
  #     if photo.attributes.values.include?(params[:value])
  #       photo
  #     end
  #   end
  # end
# search based on any work in any attribute

  private
  def photo_params
    params.require(:photo).permit(:artist, :title, :url)
  end

end
