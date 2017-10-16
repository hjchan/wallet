class TransactionsController < ApplicationController

  def create
    transaction = current_user.transactions.new(create_params)
    if !(transaction.save)
      flash[:alert] = transacion.errors.messages
    end
    redirect_to root_path
  end

  private

  def create_params
    params.require(:transaction).permit(:crypto_id, :todo, :date, :amount, :price)
  end

end
