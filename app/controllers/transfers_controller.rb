class TransfersController < ApplicationController
  def create
    account = Account.new
    @response = account.transfer(transfer_params)
  end

  private

  def transfer_params
    params.require(:transfer).permit(:private_key, :recipient, :amount)
  end
end
