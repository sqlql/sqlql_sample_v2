class LikesController < ApplicationController
  before_action :authenticate

  def create
    comment = Comment.find(params[:comment_id])
    like = Like.create!(comment: comment, user: @user)
    render json: like
  end

  def destroy
    @user.likes.find(params[:id]).destroy!
    head :no_content
  end
end
