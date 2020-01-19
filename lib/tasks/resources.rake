#This is to get all the existing resources from the Scheduler database and save them into the resource repository
#Ideally, this should be run only once when deploying the new feature to the servers

def get_full_resources_data(offset, limit)
  begin
    request = RestClient::Request.new(
      method: :get,
      url: "#{$base_scheduler_uri}/#{$resources_mapping}/#{$get_all_resources_uri}/#{offset}/#{limit}"
    )
    response = JSON.parse(request.execute)
    # debugger
  rescue => e
    nil
  end
end

def get_resources
  $base_scheduler_uri = "#{SCHEDULER_IP}"
  $get_all_resources_uri = "#{GET_FULL_RESOURCES_DATA}"
  $resources_mapping = "#{SCHEDULER_RESOURCES}"
  $resource_repository = ResourceRepository.new( index_name: :resources, type: :resource, klass: Resource)
  $resource_repository.create_index!
  limit = ("#{SCHEDULER_LIMIT}").to_i
  offset = 0
  loop do
    resources = get_full_resources_data(offset, limit)
    unless resources.nil?
      resources.each do |res|
        resource = {
          "id": res["resourceID"],
          "name": res["resourceName"].downcase,
          "content_partner_id": res["contentPartnerID"],
          # "content_partner_name": res["contentPartnerName"],
          # "last_harvest_status": res["lastHarvestStatus"],
          "is_approved": res["approved"]}
        $resource_repository.save(resource)
        # debugger
      end
    end
    offset += limit
    break unless resources.present?
  end
end

namespace :resources do
  desc "TODO"  
  task :get_all => :environment do
     get_resources
  end
  
end
