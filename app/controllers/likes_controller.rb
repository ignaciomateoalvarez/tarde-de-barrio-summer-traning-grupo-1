class LikesController < ApplicationController
  include ActionView::RecordIdentifier

  before_action :find_comment

  def create
    @comment.likes.create(user: current_user)
  end

  def destroy
    @like = @comment.likes.find_by(user_id: current_user.id)
    @like.destroy
    render turbo_stream: turbo_stream.replace(
      dom_id(@comment, :like),
      partial: "students/likes_count",
      locals: { comment: @comment, student: @comment.student }
    )
  end

  private

  def find_comment
    @comment = Comment.find(params[:comment_id])
  end

end
