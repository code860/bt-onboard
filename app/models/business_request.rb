class BusinessRequest
  def self.request(params)
    {
      :legal_name => params[:legal_name],
      :dba_name => params[:dba_name],
      :tax_id => params[:tax_id],
      :address => {
        :street_address => params[:address][:street_address],
        :locality => params[:address][:locality],
        :region => params[:address][:region],
        :postal_code => params[:address][:postal_code]
      }
    }
  end
end
