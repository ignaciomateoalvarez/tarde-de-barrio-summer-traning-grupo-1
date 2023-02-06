class ApplicationController < ActionController::Base
  before_action :require_login
  add_flash_types :success, :warning

  private
  def not_authenticated
    redirect_to login_path
  end
  include Pagy::Backend
end
