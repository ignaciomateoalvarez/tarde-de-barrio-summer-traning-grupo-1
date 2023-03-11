class PostPresenter
  def initialize(posts)
    @posts = posts
  end

  def highlighted_post_count
    Post.highlighted.count
  end

  def order_by_day(date = Date.today)
    post_of_day(date).order(created_at: :desc).group_by { |post| post.created_at.to_date }
  end

  def post_of_day (date = Date.today)
    post_of_day ||= @posts.where(created_at:date.all_day)
  end

  def grouped_posts (date)
    {
      highlighted: post_of_day(date).where(highlight: true).group_by { |p| p.created_at.to_date }.sort.reverse,
      not_highlighted: post_of_day(date).where(highlight: false).group_by { |p| p.created_at.to_date }.sort.reverse
    }
  end
end
