class ContractsController < ApplicationController

  def create
    contract = Contract.create(contract_params)
    puts "XXXXXXXXX"
    puts contract.text_file
    puts "XXXXXXXXX"
    redirect_to user_profile_path
  end

  private
  def contract_params
    params.require(:contract).permit(:text_file)
  end

end
