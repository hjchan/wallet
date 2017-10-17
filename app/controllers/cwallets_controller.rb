class CwalletsController < ApplicationController

  def create
    if signed_in?
      cwallet = current_user.cwallets.new(crypto_id: Crypto.find_by_name(params[:crypto_name]).id)
      if !(cwallet.save)
        flash[:alert] = cwallet.errors.messages
      end
    else
      flash[:alert] = "Please Sign In"
    end
    redirect_to root_path
  end

end
