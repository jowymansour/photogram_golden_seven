class PhotosController < ApplicationController
  def index
    @list_of_photos = Photo.all
  end

  def show
    photo_id = params[:id]
    @photo = Photo.find_by({ :id => photo_id })
  end

  def new_form
  end

  def create_row
    photo_image_url = params["the_source"]
    photo_caption = params["the_caption"]

    photo = Photo.new(source: photo_image_url, caption: photo_caption )
    if photo.save
      flash[:success] = "Your photo has been succesfully added."
      redirect_to 'http://localhost:3000/photos'
    else
      flash[:danger] = "Please enter an image URL to continue"
      render 'new_form'
    end

  end

  def destroy
    Photo.find(params[:id]).destroy
    flash[:success] = "The photo is succesfully deleted"
    redirect_to 'http://localhost:3000/photos'
  end

  def edit_form
    photo_id = params[:id]
    @photo = Photo.find_by({ :id => photo_id })
  end

  def update_row
    @photo = Photo.find_by({ :id => params[:id] })
    @photo.caption = params["the_caption"]
    @photo.source = params["the_source"]
    if @photo.save
      flash[:success] = "Your photo has been succesfully updated."
      render 'show'
    else
      flash[:danger] = "Please enter an image URL to continue"
      render 'edit_form'
    end
  end

end
