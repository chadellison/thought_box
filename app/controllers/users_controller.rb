class UsersController < ApplicationController
  def create
    user = User.create(user_params)
    if user.save
      session[:user_id] = user.id
      redirect_to root_path
    else
      redirect_to authentication_path
    end
  end

    def user_params
      params.require(:user).permit(:username, :email, :password)
    end
  end
end
