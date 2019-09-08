class ContentPartnerApi
   # @schedular_uri = 'http://172.16.0.161:80/scheduler'
  @schedular_uri = ENV['schedular_ip']
  @storage_uri = ENV['storage_ip']
  @logo_ip = ENV['logo_ip'] 

  def self.add_content_partner?(params, current_user_id)
    input_logo = params[:logo].nil? ? File.new(DEFAULT_CONTENT_PARTNER_LOGO, 'rb') : params[:logo].tempfile
    #file_name = params[:logo].original_filename
    file_name = params[:logo].nil? ? Pathname.new(DEFAULT_CONTENT_PARTNER_LOGO).basename : params[:logo].original_filename
    logo = Tempfile.new("#{file_name}")
    logo_path_array = logo.path.split("/")
    logo_name = logo_path_array.last
    logo.write(input_logo.read.force_encoding(Encoding::UTF_8))
    begin
      request =RestClient::Request.new(
        method: :post,
        url: "#{@schedular_uri}/contentPartners",
        payload: { name: params[:name], description: params[:description], url: params[:url], abbreviation: params[:abbreviation] ,logoPath: "path", multipart: true}
      )
      response = request.execute
      content_partner_id = response.body
      ContentPartnerUser.create(user_id: current_user_id , content_partner_id: response.body.to_i)
      content_partner_id 
    rescue => e
      nil
    end
    begin
      logo.open
      logo.seek 0
      logo_request =RestClient::Request.new(
        method: :post,
        url: "#{@storage_uri}/uploadCpLogo/#{content_partner_id}",
        payload: { logo: logo }
      )
      logo_response = logo_request.execute
      content_partner_id
    rescue => e
      nil
    end
    
    if logo_response
      begin
        logo.open
        request = RestClient::Request.new(
          method: :post,
          url: "#{@schedular_uri}/contentPartners/#{content_partner_id}",
          payload: { name: params[:name], description: params[:description], url: params[:url], abbreviation: params[:abbreviation] , logoPath: "#{@logo_ip}/eol_workspace/contentPartners/#{content_partner_id}/#{logo_name}", multipart: true}
          )
        response_update = request.execute
        content_partner_id
        rescue => e
          nil
      end
    end
    
  end
  
  #required to remove logo parameter from scheduler to work in case of  empty logo
  def self.update_content_partner?(content_partner_id, params)

    # if !params[:logo].nil?
      # logo.open 
    # end
    if params[:logo].nil?
      returned_content_partner = get_content_partner_without_resources(content_partner_id)
      @content_partner_data = ContentPartner.new(name: returned_content_partner["name"], abbreviation: returned_content_partner["abbreviation"],
                                      url: returned_content_partner["url"], description: returned_content_partner["description"],
                                      logo: returned_content_partner["logoPath"])
     logo_path = @content_partner_data.logo
    else
      input_logo = params[:logo].tempfile
      file_name = params[:logo].original_filename
      logo = Tempfile.new("#{file_name}")
      logo.write(input_logo.read.force_encoding(Encoding::UTF_8))
      logo_path_array = logo.path.split("/")
      logo_name = logo_path_array.last
      logo_path = "#{@logo_ip}/eol_workspace/contentPartners/#{content_partner_id}/#{logo_name}"
      begin
        logo.open
        logo.seek 0
        logo_request =RestClient::Request.new(
          method: :post,
          url: "#{@storage_uri}/uploadCpLogo/#{content_partner_id}",
          payload: { logo: logo }
          )
      logo_response = logo_request.execute
      content_partner_id
      rescue => e
        nil
      end
    end
  
    begin
      response =RestClient.post(
        "#{@schedular_uri}/contentPartners/#{content_partner_id}",
        { name: params[:name], description: params[:description], url: params[:url], abbreviation: params[:abbreviation] ,logoPath: logo_path, :multipart => true}
      )
      content_partner_id
    rescue => e
      nil
    end
  end
  
  def self.get_content_partner_without_resources(content_partner_id)
    begin
      request =RestClient::Request.new(
        method: :get,
        url: "#{@schedular_uri}/contentPartners/#{content_partner_id}"
      )
      response = JSON.parse(request.execute)
    rescue => e
      nil
    end
  end
  
    def self.get_content_partner_with_resources(content_partner_id)
    begin
      request =RestClient::Request.new(
        method: :get,
        url: "#{@schedular_uri}/contentPartners/contentPartnerWithResources/#{content_partner_id}"
      )
      response = JSON.parse(request.execute)
    rescue => e
      nil
    end
  end
  
  def self.get_content_partner_resource_id(id)
    begin
      request =RestClient::Request.new(
        method: :post,
        url: "#{@schedular_uri}/contentPartners/contentPartnerOfResource",
        payload: {resId: id}

      )
      response = JSON.parse(request.execute)
    rescue => e
      nil
    end
  end
end


