class AddressRequest
  def self.request(params)
    {
      street_address: params[:street_address],
      locality: params[:locality],
      region: params[:region],
      postal_code: params[:postal_code]
    }
  end
end
