class SessionController < ApplicationController
  skip_before_action :require_login, only: [:create, :login, :register]
  def create
    @user = User.find_by(email: params[:email])
    if @user.present?
      if @user.active?
        if login(params[:email], params[:password], remember_me = params[:remember_me])
          redirect_back_or_to(root_path, success: t('.success'))
        else
          redirect_to(login_path, warning: t('.warning'))
        end
      else
        redirect_to(login_path, notice: t('.notice'))
      end
    else
      redirect_to(login_path, warning: t('.warning'))
    end
  end

  def destroy
    logout
    redirect_to(login_path, notice: t('.notice'))
  end
end
