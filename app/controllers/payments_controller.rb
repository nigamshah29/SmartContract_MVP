class PaymentsController < ApplicationController
# binding.pry
#   address = contract.deploy_and_wait("Hello from ethereum.rb!")


  def request_payment
  	binding.pry
  	ipc_file = Rails.root.join("app", "smart_contract", "coderMVP2.sol").to_s
  	contract = Ethereum::IpcClient.new(ipc_file, false)
  	# @contract = Ethereum::Contract.create(file: Rails.root.join("app", "smart_contract", "contracts", "coderMVP2.sol").to_s)
  	binding.pry
  	reqID = params[:reqID]
  	payment_amount = params[:payment_amount]
  	contract.init.start_requirement
  end

  def receive_payment
  end


end
