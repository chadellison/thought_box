class SessionsController < ApplicationController
  def create
    @user = User.find_by(username: params[:session][:username])
    if @user && @user.authenticate(params[:session][:password])
      session[:user_id] = @user.id
      redirect_to root_path
    else
      flash[:error] = "Invalid Login"
      redirect_to authentication_path
    end
  end

  def destroy
    session.clear
    redirect_to authentication_path
  end
end
