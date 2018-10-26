class Account::PhotosController < ApplicationController
  respond_to :json

  def create
    @photo = current_user.photos.build
    @photo.image = params[:image]
    if @photo.save!
      render json: {
        success: true,
        image: {
          name: @photo.image.identifier,
          url: @photo.image.url
        }
      }
    end
  end
end
