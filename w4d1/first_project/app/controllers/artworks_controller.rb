class ArtworksController < ApplicationController
  # def index
  #   @Artworks = Artwork.all
  #
  #   render json: @Artworks
  # end

  def index
    @Artworks = User.find_by(id: params[:user_id]).artworks + User.find_by(id: params[:user_id]).shared_artworks

    render json: @Artworks

  end

  def create
    @artwork = Artwork.new(artwork_params)

    if @artwork.save
      render json: @artwork
    else
      render(
      json: @artwork.errors.full_messages, status: :unprocessable_entity
      )
    end
  end

  def show
    set_artwork

    render json: @artwork
  end

  def update
    set_artwork

    if @artwork.update(artwork_params)
      render json: @artwork
    else
      render(
      json: @artwork.errors.full_messages, status: 404
      )
    end
  end

  def destroy
    set_artwork

    if @artwork.destroy
      render json: @artwork
    else
      render(
      json: @artwork.errors.full_messages, status: 404
      )
    end
  end

  private

  def artwork_params
    params.require(:artwork).permit(:image_url, :artist_id, :title)
  end

  def set_artwork
    @artwork = Artwork.find_by(id: params[:id])
  end
end
