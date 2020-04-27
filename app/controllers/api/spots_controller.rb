class Api::SpotsController < ApplicationController
  protect_from_forgery

  def index
    @spots = Spot.all
    @spots = @spots.map do |spot|
      {
        id: spot.id,
        title: spot.title,
        comment: spot.comment,
        mood: spot.mood,
        picture: spot.picture.url,
        latitude: spot.latitude,
        longitude: spot.longitude
      }
    end
    render json: @spots
  end

  def show
    @spot = Spot.find(params[:id])
    @spot = {
      id: @spot.id,
      title: @spot.title,
      comment: @spot.comment,
      mood: @spot.mood,
      picture: @spot.picture.url,
      latitude: @spot.latitude,
      longitude: @spot.longitude
    }
    render json: @spot
  end

  def create
    @spot = Spot.new(spot_params)
    if @spot.save
      spot_json =
        {
          id: @spot.id,
          title: @spot.title,
          comment: @spot.comment,
          mood: @spot.mood,
          picture: @spot.picture,
          latitude: @spot.latitude,
          longitude: @spot.longitude,
          params: spot_params
        }
      render json: spot_json
    else
      render status: 400, json: { "message": "spot creation faild" }
    end
  end

  def show
    render json: { "chinko": "unko" }
  end

  def update
    if @spot.update(spot_params)
      spot_json =
        {
          id: @spot.id,
          title: @spot.title,
          comment: @spot.comment,
          mood: @spot.mood,
          picture: @spot.picture.url,
          latitude: @spot.latitude,
          longitude: @spot.longitude
        }
      render json: spot_json
    else
      render status: 400, json: { "message": "spot updation faild" }
    end
  end

  def destroy
    Spot.find(params[:id]).destroy
    render json: { "message": "spot successfully removed" }
  end

  private
    def spot_params
      puts "unko"
      puts "unko"
      puts params[:spot][:picture]
      puts "unko"
      puts "unko"
      params.require(:spot).permit(:id, :title, :comment, :mood, :picture, :latitude, :longitude)
    end
end
