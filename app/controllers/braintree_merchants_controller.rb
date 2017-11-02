class BraintreeMerchantsController < ApplicationController
  def client_id
    token = Braintree::ClientToken.generate
    render json: {token: token}
  end

  def onboard
    merchant_account_params = {
      :individual => IndividualRequest.request(params[:individual]),
      :business => BusinessRequest.request(params[:business]),
      :funding => FundingRequest.request(params[:funding]),
      :tos_accepted => true,
      :master_merchant_account_id => ENV.fetch('BT_MASTER_MERCHANT_ID'),
      :id => params[:id]
    }
    result = Braintree::MerchantAccount.create(merchant_account_params)
    render json: result.success? ? {merchant_id: result.merchant_account.id, status: result.merchant_account.status} : result.errors
  end

  def update_merchant
    merchant = params[:merchant_id]
    funding = FundingRequest.request(params[:funding])
    result = Braintree::MerchantAccount.update(merchant, funding: funding)
    render json: result.success? ? {success: true, message: "Successfully updated merchant account" ,merchant_id: result.merchant_account.id, status: result.merchant_account.status} : {success: false, errors: result.errors}
  end

end
