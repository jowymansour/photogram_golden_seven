class PhotosController < ApplicationController
  def index
    @list_of_photos = Photo.all
  end

  def show
    photo_id = params[:id]
    @photo = Photo.find_by({ :id => photo_id })
  end

end
