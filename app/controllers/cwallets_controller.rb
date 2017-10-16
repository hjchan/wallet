class CwalletsController < ApplicationController

  def create
    if signed_in?
      cwallet = current_user.cwallets.new(crypto_id: params[:crypto_id])
      if !(cwallet.save)
        flash[:alert] = cwallet.errors.messages
      end
    else
      flash[:alert] = "Please Sign In"
    end
    redirect_to root_path
  end

end
