class PostPresenter
  def initialize(posts)
    @posts = posts
  end

  def order_by_day
    @posts.order(created_at: :desc).group_by { |post| post.created_at.to_date }
  end
end