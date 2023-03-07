class CommentsController < ApplicationController

  def create
    @comment = Comment.new(comment_params.merge(user: current_user))
    @comment.highlight = params[:comment][:highlight].present?
    attach_files if params[:comment][:attachment].present?

    if @comment.save
      redirect_to student_comments_path, notice: t('.notice')
    else
      redirect_to student_comments_path, warning: t('.warning')
    end
  end
   
  def new; end

  private

  def attach_files
    params[:comment][:attachment].each do |attachment|
      @comment.attachment.attach(attachment)
    end
  end

  def comment_params
    params.require(:comment).permit(:body,:attachment).merge(student_id: params[:student_id])
  end
end
