class ImagesController < ApplicationController
  def index 
    images = Image.all
    render json: images.as_json
  end
end
