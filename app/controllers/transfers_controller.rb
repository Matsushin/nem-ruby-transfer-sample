class TransfersController < ApplicationController
  def create
    private_key = transfer_params[:private_key]
    node = Nem::Node.new(host: 'bigalice2.nem.ninja')
    kp = Nem::Keypair.new(private_key)
    tx_endpoint = Nem::Endpoint::Transaction.new(node)
    tx = Nem::Transaction::Transfer.new(transfer_params[:recipient], transfer_params[:amount].to_f, '送金テストです')
    req = Nem::Request::Announce.new(tx, kp)
    $response = tx_endpoint.announce(req)
  end

  private

  def transfer_params
    params.require(:transfer).permit(:private_key, :recipient, :amount)
  end
end
