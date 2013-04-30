class Account::PhotosController < ApplicationController
  def create
    photo = current_user.photos.build
    photo.image = params[:image]
    photo.save!
  end
end
