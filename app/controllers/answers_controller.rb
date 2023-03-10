class AnswersController < ApplicationController
  def create
    @comment = Comment.find(params[:comment_id])
    @answer = @comment.answers.create(answer_params.merge(user: current_user))

    if @answer.save
      redirect_to student_comments_path, notice: t('.created')
    else
      redirect_to student_comments_path, warning: t('.not_created')
    end
  end

  def create_post
    @post = Post.find(params[:post_id])
    @answer = @post.answers.create(answer_params_post.merge(user: current_user))

    if @answer.save
      redirect_to root_path notice: t('.created')
    else
      redirect_to root_path warning: t('.not_created')
    end
  end

  private

  def answer_params
    params.require(:answer).permit(:reply).merge(comment_id: params[:comment_id])
  end

  def answer_params_post
    params.require(:answer).permit(:reply).merge(post_id: params[:post_id])
  end

end