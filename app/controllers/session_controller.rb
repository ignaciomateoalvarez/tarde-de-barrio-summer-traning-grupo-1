class SessionController < ApplicationController
  skip_before_action :require_login, only: [:create, :login, :register]
  def create
    @user = User.find_by(email: params[:email])
    if @user.present?
      if @user.active?
        if login(params[:email], params[:password], remember_me = params[:remember_me])
          if @user.administrador?
            redirect_back_or_to(users_path, success: t('.success'))
          else
            redirect_back_or_to(students_path, success: t('.success'))
          end
        else
          redirect_to(login_path, warning: t('.warning'))
        end
      else
        redirect_to(login_path, notice: t('.notice'))
      end
    else
      redirect_to(login_path, warning: "usuario incorrecto")
    end
  end
  def destroy
    logout
    redirect_to(login_path, notice: t('.notice'))
  end
end
