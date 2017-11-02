class BusinessRequest
  def self.request(params)
    {
      :legal_name => params[:legal_name],
      :dba_name => params[:dba_name],
      :tax_id => params[:tax_id],
      :address => AddressRequest.request(params[:address])
    }
  end
end
