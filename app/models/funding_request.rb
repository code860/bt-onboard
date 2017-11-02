class FundingRequest
  def self.request(params)
    {
      descriptor: params[:descriptor],
      destination: Braintree::MerchantAccount::FundingDestination::Bank,
      email: params[:email],
      mobile_phone: params[:mobile_phone],
      account_number: params[:account_number],
      routing_number: params[:routing_number]
    }
  end
end
