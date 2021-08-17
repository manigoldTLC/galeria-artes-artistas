class Api::V1::PaintingsController < ApplicationController

  def index
    paintings = Painting.all

    render json: paintings, status: :ok
  end

  def create
    painting = Painting.new(painting_params)
    painting.save!

    render json: painting, status: :created
  rescue StandardError => e
    render json: { message:'Não foi possível criar uma pintura' }, status: :bad_request
  end

  def show
    painting = Painting.find(params[:id])

    render json: painting, status: :ok
  rescue StandardError => e
    render json: { message:'Não foi possível visualizar a pintura' }, status: :bad_request
  end

  def update
    paintings = Painting.find(params[:id])
    painting.update!(painting_params)

    render json: painting, status: :ok
  rescue StandardError => e
    render json: { error: e.message }, status: :bad_request
  end

  def destroy
    painting = Painting.find(params[:id])
    painting.destroy!

    render json: painting, status: :ok
  rescue StandardError => e
    render json: { error: e.message }, status: :bad_request
  end

  private

  def painting_params
    params.require(:painting).permit(
      :name,
      :artist_id,
      :artstyle_id,
      :description,
      image = []
    )
  end
end

#Painting.create(name:'Corno montado', artist_id:'1', artstyle_id:'1', description:'bla', year:'2',)