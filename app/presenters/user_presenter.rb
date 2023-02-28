class UserPresenter
  attr_reader :params

  def initialize(params, students = [])
    @params = params
  end

  def filter
    @filter ||= UserFilter.new(User.all.order(updated_at: :desc), filter_params)
  end

  def users
    @users ||= filter.call.order(created_at: :desc)
  end

  def user
    User.find_by(id: @params[:id]).decorate
  end

  def decorated_users
    @users = StudentDecorator.decorate_collection(@users)
  end

  private

  def filter_params
  params.fetch(:user_filter, {}).permit(
    :full_name
  )
  end
end
