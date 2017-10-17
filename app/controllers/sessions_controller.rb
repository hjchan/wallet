class SessionsController < ApplicationController

  def create
    user = User.from_omniauth(request.env["omniauth.auth"])
    if user.save
      session[:id] = user.id
    else
      flash[:danger] = user.errors.messages
    end
    redirect_to root_path
  end

  def destroy
    session[:id] = nil
    flash[:success] = "Logout Successfully"
    redirect_to root_path
  end

end
