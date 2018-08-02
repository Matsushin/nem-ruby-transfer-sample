class AccountsController < ApplicationController

  def show
    require 'pp'
    require 'nem'
    node = Nem::Node.new(host: 'bigalice2.nem.ninja')
    account_endpoint = Nem::Endpoint::Account.new(node)
    @account = account_endpoint.find(account_params[:address])
  end

  private

  def account_params
    params.require(:account).permit(:address)
  end
end
