class CommentsController < ApplicationController
  def create
    @comment = Comment.new(comment_params.merge(user: current_user))
    @comment.highlight = params[:comment][:highlight].present?

    if @comment.save
      redirect_to student_comments_path, notice: t('.notice')
    else
      redirect_to student_comments_path, warning: t('.warning')
    end
  end

  def new; end

  private

  def comment_params
    params.require(:comment).permit(:body).merge(student_id: params[:student_id])
  end
end
