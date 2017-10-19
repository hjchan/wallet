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

  def edit
    @transaction = Transaction.find_by_id(params[:id])
    respond_to do |format|
      format.js
    end
  end

  def update
    transaction = Transaction.find_by_id(params[:id])
    if transaction.user_id == current_user.id
      if transaction.update(update_params)
        flash[:success] = "Update Success"
      else
        flash[:danger] = transaction.errors.messages
      end
    else
      flash[:danger] = "You are not authorise."
    end
    redirect_to root_path
  end

  def destroy
    transaction = Transaction.find_by_id(params[:id])
    if transaction.destroy
      flash[:success] = "Delete Success"
    else
      flash[:danger] = transaction.errors.messages
    end
    redirect_to root_path
  end

  private

  def create_params
    params.require(:transaction).permit(:crypto_id, :todo, :date, :amount, :price)
  end

  def update_params
    params.require(:transaction).permit(:date, :amount, :price)
  end


end
