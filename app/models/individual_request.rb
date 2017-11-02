class IndividualRequest
  def self.request(params)
    {
      first_name: params[:first_name],
      last_name: params[:last_name],
      email: params[:email],
      phone: params[:phone],
      date_of_birth: params[:date_of_birth],
      ssn: params[:ssn],
      address: AddressRequest.request(params[:address])
    }
  end
end
