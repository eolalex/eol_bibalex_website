class ResourceApi
  @base_scheduler_uri = ENV['SCHEDULER_IP']
  @base_storage_uri = ENV['STORAGE_IP']

  def self.add_resource?(params, content_partner_id)
    if params[:type] == "file"
     input_file = params[:path].tempfile
     file_name = params[:path].original_filename
     resource_data_set_file = Tempfile.new("#{file_name}")
     resource_data_set_file.write(input_file.read.force_encoding("UTF-8"))
     params[:path] = ""
    end
    resource_params = params

    begin
      request = RestClient::Request.new(
        method: :post,
        url: "#{@base_scheduler_uri}/#{content_partner_id}/resources",
        headers: {
          'Accept': 'application/json',
          'Content-Type': 'application/json'
          },
        payload: resource_params.to_json
      )
      response_scheduler = request.execute
      resource_id = response_scheduler.body
      if params[:type] == "file"
        begin
          resource_data_set_file.seek 0
          request = RestClient::Request.new(
            method: :post,
            url: "#{@base_storage_uri}/uploadResource/#{resource_id}/1",
            payload: {
              resId: resource_id,
              file: resource_data_set_file,
              isOrg: 1
            }
          )
        response_storage = request.execute
        resource_id
        rescue => e
          nil
        end
        if response_storage
          params[:path] = "/eol_workspace/resources/#{resource_id}/"
          resource_params = params
          begin
            request = RestClient::Request.new(
              method: :post,
              url: "#{@base_scheduler_uri}/#{content_partner_id}/resources/#{resource_id}",
              headers: {
                'Accept': 'application/json',
                'Content-Type': 'application/json'
                },
              payload: resource_params.to_json
            )
            response = request.execute
            resource_id
          rescue => e
            nil
          end
        end
      end
      resource_id
    rescue => e
      nil
    end
  end

  def self.update_resource?(params, content_partner_id, resource_id)
    if params[:type] == "file" && !params[:path].nil?
      resource_data_set_file = params[:path].tempfile
      params[:path] = ""
      begin
        request = RestClient::Request.new(
          method: :post,
          url: "#{@base_storage_uri}/uploadResource/#{resource_id}/1",
          payload: {
            resId: resource_id,
            file: resource_data_set_file,
            isOrg: 1
          }
        )
        response_storage = request.execute
        resource_id
      rescue => e
        nil
      end
      if(response_storage)
        params[:path] = "/eol_workspace/resources/#{resource_id}/"
      end
    end
    resource_params = params

    begin
      request = RestClient::Request.new(
        method: :post,
        url: "#{@base_scheduler_uri}/#{content_partner_id}/resources/#{resource_id}",
        headers: {
          'Accept': 'application/json',
          'Content-Type': 'application/json'
          },
        payload: resource_params.to_json
      )
      response = request.execute
      resource_id
    rescue => e
      nil
    end
  end

  def self.get_resource(content_partner_id, resource_id)
    begin
      request = RestClient::Request.new(
        method: :get,
        url: "#{@base_scheduler_uri}/#{content_partner_id}/resources/#{resource_id}"
      )
      response = JSON.parse(request.execute)
    rescue => e
      nil
    end
  end

   def self.get_resource_using_id(resource_id)
    begin
      request = RestClient::Request.new(
        method: :get,
        url: "#{@base_scheduler_uri}/resources/#{resource_id}"
      )
      response = JSON.parse(request.execute)
    rescue => e
      nil
    end
  end

  def self.get_all_resources_with_full_data(start_id, end_id)
    begin
      request = RestClient::Request.new(
        method: :get,
        url: "#{@base_scheduler_uri}/#{ENV['GET_ALL_RESOURCES']}/#{start_id}/#{end_id}"
      )
      response = JSON.parse(request.execute)
    rescue => e
      nil
    end
  end

  def self.get_resource_statistics(resource_id)
    begin
      request = RestClient::Request.new(
        method: :get,
        url: "#{MYSQL_ADDRESS}/#{ENV['GET_RESOURCE_INFO']}/#{resource_id}"
      )
      response = JSON.parse(request.execute)
    rescue => e
      nil
    end
  end  

  def self.get_harvest_history(resource_id)
    begin
      request = RestClient::Request.new(
        method: :get,
        url: "#{@base_scheduler_uri}/#{ENV['get_harvest_history']}/#{resource_id}"
      )
      response = JSON.parse(request.execute)
    rescue => e
      nil
    end
  end

  def self.get_last_harvest_log(resource_id)
    begin
      request = RestClient::Request.new(
        method: :get,
        url: "#{@base_scheduler_uri}/#{ENV['GET_LAST_HARVEST_LOG']}/#{resource_id}"
      )
      response = JSON.parse(request.execute)
    rescue => e
      nil
    end
  end  

  def self.get_resource_boundaries
    begin
      request = RestClient::Request.new(
        method: :get,
        url: "#{@base_scheduler_uri}/#{ENV['GET_RESOURCE_BOUNDARIES']}"
      )
      response = JSON.parse(request.execute)
    rescue => e
      nil
    end
  end
end

