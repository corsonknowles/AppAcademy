class CommentsController < ApplicationController


  def index
    @comments = User.find_by(id: params[:user_id]).comments
    @comments ||= Artwork.find_by(id: params[:artwork_id]).comments
    render json: @comments
  end

  def create
    @comment = Comment.new(comment_params)

    if @comment.save
      render json: @comment
    else
      render(
      json: @comment.errors.full_messages, status: :unprocessable_entity
      )
    end
  end

  def destroy
    @comment = Comment.find_by(id: params[:id])

    if @comment.destroy
      render json: @comment
    else
      render(
      json: @comment.errors.full_messages, status: 404
      )
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:user_id, :artwork_id)
  end
end
