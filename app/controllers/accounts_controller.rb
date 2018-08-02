class AccountsController < ApplicationController

  def show
    account = Account.new
    @account_info = account.get_info(account_params[:address])
  end

  private

  def account_params
    params.require(:account).permit(:address)
  end
end
