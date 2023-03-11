class PostController < ApplicationController
  include DateHelper

  def index
    @presenter = PostPresenter.new(Post.all)
    @date = params[:date]&.to_date || Date.today
    @posts = @presenter.order_by_day(@date)
    @highlighted_post_count = Post.highlighted.count
    @students = Student.all
    @users = User.all
    @attendances = Attendance.all
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
    params.require(:post_home).permit(:body, :highlight, attachment: []).merge(user_id: current_user.id)
  end
end
