class Account
  DEFAULT_HOST = 'bigalice2.nem.ninja'.freeze
  require 'pp'
  require 'nem'
  attr_reader :node

  def initialize
    @node = Nem::Node.new(host: DEFAULT_HOST)
  end

  def get_info(address)
    account_endpoint = Nem::Endpoint::Account.new(@node)
    account_endpoint.find(address)
  end

  def transfer(params)
    private_key = params[:private_key]
    keypair = Nem::Keypair.new(private_key)
    tx_endpoint = Nem::Endpoint::Transaction.new(@node)
    tx = Nem::Transaction::Transfer.new(params[:recipient], params[:amount].to_f, '送金テストです')
    request = Nem::Request::Announce.new(tx, keypair)
    tx_endpoint.announce(request)
  end
end
