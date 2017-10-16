module UsersHelper

  def current_user
    if session[:id]
      @current_user ||= User.find_by_id(session[:id])
    end
  end

  def signed_in?
    !current_user.nil?
  end
  
end
