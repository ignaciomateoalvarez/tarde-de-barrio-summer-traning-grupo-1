class UserDecorator < Draper::Decorator
  delegate_all
  include Draper::LazyHelpers

  def full_name_user 
    "#{user.first_name} #{user.last_name}"
  end
end
