class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]
  def index
    @presenter = UserPresenter.new(params)
    @pagy, @records = pagy(@presenter.users)
  end
  def new
    @user = User.new
  end

  def create
    @user = User.new(params_register)
    if @user.save
      redirect_to users_path, notice: t('notice')
    else
      redirect_to users_path, warning: t('warning')
    end
  end

  def edit; end

  def update
    @user.update(user_params)
    redirect_to users_path
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def params_register
    params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation)
  end

  def user_params
    params.require(:user).except(:rol).permit(:first_name, :last_name, :email)
  end
end
