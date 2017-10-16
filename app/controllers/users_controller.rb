class UsersController < ApplicationController
  def create
    user = User.new(user_from_params)
    if user.save
      session[:id] = user.id
      redirect_to root_path
    else
      flash[:alert] = user.errors.messages
      redirect_to root_path
    end
  end

  def login
    user = User.find_by_email(params[:user][:email])
    if user.nil?
      flash[:alert] = "Wrong Email"
    else
      if user.authenticate(params[:user][:password])
        flash[:messages] = "Login Successfully"
        session[:id] = user.id
      else
        flash[:alert] = "Wrong Password"
      end
    end
    redirect_to root_path
  end

  def logout
    session[:id] = nil
    flash[:messages] = "Logout Successfully"
    redirect_to root_path
  end

  def show
    if signed_in?
      @user = current_user
      @cryptos = @user.cryptos
      if params[:date].nil?
        @date = Date.today-30..Date.today
      else
        date = params[:date].partition(' to ')
        start_date = Date.parse(date[0])
        end_date = Date.parse(date[2])
        @date = start_date..end_date
      end
    else
      @user = User.new
    end
  end

  private

  def user_from_params
    params.require(:user).permit(:email, :password, :password_confirmation)
  end

end
