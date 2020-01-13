class HarvesterApi
  def self.get_harvest_records(status, offset, limit)
    begin
      request = RestClient::Request.new(
        method: :get,
        url: "#{ENV['schedular_ip']}/#{ENV['SCHEDULER_HARVEST']}/#{ENV['GET_HARVEST_RECORDS_ACTION']}/#{status}/#{offset}/#{limit}"
      )
      response = JSON.parse(request.execute)
    rescue => e
      nil
    end
  end

  def self.change_position(resource_id, direction, new_position)
    begin
      request = RestClient::Request.new(
        method: :get,
        url: "#{ENV['schedular_ip']}/resources/#{resource_id}/changePosition/#{direction}/#{new_position}"
      )
      response = JSON.parse(request.execute)
    rescue => e
      nil
    end
  end

  def self.swap(first_resource_id, second_resource_id)
    begin
      request = RestClient::Request.new(
        method: :get,
        url: "#{ENV['schedular_ip']}/resources/swap/#{first_resource_id}/#{second_resource_id}"
      )
      response = JSON.parse(request.execute)
    rescue => e
      nil
    end
  end

  def self.move_resource_to_end(resource_id, end_resource_id, direction)
    # debugger
    begin
      request = RestClient::Request.new(
        method: :get,
        url: "#{ENV['schedular_ip']}/resources/moveToEnd/#{resource_id}/#{end_resource_id}/#{direction}"
      )
      # debugger
      response = JSON.parse(request.execute)
      # debugger
    rescue => e
      nil
    end
  end
end