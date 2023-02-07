class UsersController < ApplicationController
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
      redirect_to users_path, notice: 'Welcome'
    else
      redirect_to users_path, warning: 'Hubo un problema para crear el usuario'
    end
  end

  private

  def params_register
    params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation)
  end
end