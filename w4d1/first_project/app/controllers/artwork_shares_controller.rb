class ArtworkSharesController < ApplicationController
  # def index
  #   @artwork_shares = ArtworkShare.all
  #
  #   render json: @artwork_shares
  # end

  def create
    @artwork_shares = ArtworkShare.new(artwork_shares_params)
    # replace the `artwork_shares_attributes_here` with the actual attribute keys
    if @artwork_shares.save
      render json: @artwork_shares
    else
      render(
      json: @artwork_shares.errors.full_messages, status: :unprocessable_entity
      )
    end
  end

  # def show
  #   @artwork_shares = ArtworkShare.find_by(id: params[:id])
  #
  #   render json: @artwork_shares
  # end

  # def update
  #   @artwork_shares = ArtworkShare.find_by(id: params[:id])
  #
  #   if @artwork_shares.update(artwork_shares_params)
  #     render json: @artwork_shares
  #   else
  #     render(
  #     json: @artwork_shares.errors.full_messages, status: 404
  #     )
  #   end
  # end

  def destroy
    @artwork_shares = ArtworkShare.find_by(id: params[:id])

    if @artwork_shares.destroy
      render json: @artwork_shares
    else
      render(
      json: @artwork_shares.errors.full_messages, status: 404
      )
    end
  end
  private

  def artwork_shares_params
    params.require(:artwork_share).permit(:viewer_id, :artwork_id)
  end
end
