class TransactionsController < ApplicationController

  def create
    transaction = current_user.transactions.new(create_params)
    if !(transaction.save)
      flash[:alert] = transaction.errors.messages
    end
    redirect_to root_path
  end

  def buy
    @crypto = Crypto.find   (params[:crypto_id])
    # @crypto_id = params[:crypto_id]
    @todo = "buy"
    respond_to do |format|
      format.js { render action: 'transaction' }
    end
  end

  def sell
    @crypto = Crypto.find(params[:crypto_id])
    @crypto_id = params[:crypto_id]
    @todo = "sell"
    respond_to do |format|
      format.js { render action: 'transaction' }
    end
  end

  private

  def create_params
    params.require(:transaction).permit(:crypto_id, :todo, :date, :amount, :price)
  end

end
