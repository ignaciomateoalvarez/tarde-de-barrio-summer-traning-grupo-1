class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]

  def index
    authorize User
    @presenter = UserPresenter.new(params)
    @pagy, @records = pagy(@presenter.users)
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(params_register)
    if @user.save
      auto_login(@user)
      redirect_to users_path, notice: t('.notice')
    else
      redirect_to users_path, warning: t('.warning')
    end
  end

  def new_user
    @user = User.new(user_params)
    if @user.save_with_validations(validate_password: false)
      redirect_to users_path, notice: t('.notice')
    else
      redirect_to users_path, warning: t('.warning')
    end
  end

  def edit
    authorize User
  end

  def update
    authorize User
    @user.update(user_params)
    redirect_to users_path
  end

  def toggle_deactivate
    authorize User
    @user = User.find(params[:user_id])
    @user.toggle!(:active)
    redirect_to users_path, notice: t('.notice')
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def params_register
    params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation)
  end

  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :role)
  end

  def authorize_user
    authorize @user
  end
end