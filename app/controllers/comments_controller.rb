class CommentsController < ApplicationController
  before_action :authenticate

  def create
    comment = Comment.create!(comment_params.merge(user: @user))
    render json: comment
  end

  def update
    comment = @user.comments.find(params[:id])
    comment.update!(comment_params)
    render json: comment
  end

  def destroy
    @user.comments.find(params[:id]).destroy!
    head :no_content
  end

  private

  def comment_params
    params.require(:comment).permit(:content, :privacy)
  end
end
