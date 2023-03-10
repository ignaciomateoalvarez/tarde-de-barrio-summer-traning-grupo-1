class PostController < ApplicationController
  include DateHelper

  def index
    @presenter = PostPresenter.new(Post.all)
    @posts = @presenter.order_by_day
  end

  def create
    @post = Post.new(post_params)
    if @post.save
      redirect_to root_path, notice: t('.notice')
    else
      redirect_to root_path, warning: t('.warning')
    end
  end

  private

  def post_params
    params.require(:post_home).permit(:body, attachment: []).merge(user_id: current_user.id)
  end
end
