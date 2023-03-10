class LikesController < ApplicationController
  include ActionView::RecordIdentifier

  before_action :find_comment, only: %i[create destroy]
  before_action :find_post, only: %i[create_post destroy_post]

  def create
    @comment.likes.create(user: current_user)
  end

  def create_post
    @post.likes.create(user: current_user)
  end

  def destroy
    @like = @comment.likes.find_by(user_id: current_user.id)
    @like.destroy
    render turbo_stream: turbo_stream.replace(
      dom_id(@comment, :like),
      partial: 'students/likes_count',
      locals: { comment: @comment, student: @comment.student }
    )
  end

  def destroy_post
    @like_post = @post.likes.find_by(user_id: current_user.id)
    @like_post.destroy
    render turbo_stream: turbo_stream.replace(
      dom_id(@post, :like),
      partial: 'post/likes',
      locals: { post: @post }
    )
  end

  private

  def find_comment
    @comment = Comment.find(params[:comment_id])
  end

  def find_post
    @post = Post.find(params[:post_id])
  end
end
