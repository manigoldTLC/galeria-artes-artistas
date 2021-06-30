class Api::V1::ArtistsController < ApplicationController
  def create
    artist = Artist.new(artist_params)
    artist.save!

    render json: artist, status: :created
  rescue StandardError => e
    render json: { error: e.message }, status: :unprocessable_entity
  end

  def index
    artists = Artist.all
    render json: artists.select(
      'id',
      'name',
      'description'
    ), status: :ok
  end

  def show
    artist = Artist.find(params[:id])
    render json: {
      name: artist.name,
      description: artist.description
    }, status: :ok
  rescue StandardError => e
    render json: { error: e.message }, status: :not_found
  end

  def update
    artist = Artist.find(params[:id])
    artist.update!(artist_params)

    render json: artist, status: :ok
  rescue StandardError => e
    render json: { error: e.message }, status: :bad_request
  end

  def destroy
    artist = Artist.find(params[:id])
    artist.destroy!

    render json: artist, status: :ok
  rescue StandardError => e
    render json: { error: e.message }, status: :bad_request
  end

  private

  def artist_params
    params.require(:artist).permit(
      :name,
      :description
    )
  end
end
