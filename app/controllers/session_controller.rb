class SessionController < ApplicationController
  skip_before_action :require_login, only: [:create, :login, :register] 
  def create
    @user = login(params[:email], params[:password],remember_me = params[:remember_me])
    if @user
      redirect_back_or_to(root_path, success: t('.success'))
    else
      redirect_to(login_path, warning: t('.warning'))
    end
  end

  def destroy
    logout
    redirect_to(login_path, notice: t('.notice'))
  end
end
