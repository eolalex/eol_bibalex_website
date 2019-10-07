#This is to get all the existing resources from the Scheduler database and save them into the resource repository
#Ideally, this should be run only once when deploying the new feature to the servers

def get_full_resources_data(lower_boundary_id, end_resource_id)
  begin
    request = RestClient::Request.new(
      method: :get,
      url: "#{$base_scheduler_uri}/#{$get_all_resources_uri}/#{lower_boundary_id}/#{end_resource_id}"
    )
    response = JSON.parse(request.execute)
    rescue => e
      nil
    end
end

def get_boundary_ids
  begin
    request = RestClient::Request.new(
      method: :get,
      url: "#{$base_scheduler_uri}/#{$get_resource_ids_uri}"
      )
      response = JSON.parse(request.execute)
    rescue => e
      nil
  end
end

def get_resources
  # first, we should get first and last resource ids to split the reponse into batches
  $base_scheduler_uri = "#{SCHEDULER_IP}"
  $get_all_resources_uri = "#{GET_FULL_RESOURCES_DATA}"
  $get_resource_ids_uri = "#{GET_RESOURCE_BOUNDARIES}"
  $batch_size = "#{BATCH_SIZE}".to_i
  ResourceRepository.create_index!
  resource_repository = ResourceRepository.new
  boundary_ids = get_boundary_ids
  unless boundary_ids.nil?
    lower_boundary_id = boundary_ids["firstResourceId"]
    upper_boundary_id = boundary_ids["lastResourceId"] + $batch_size
  end
  end_resource_id = lower_boundary_id + $batch_size
  while( end_resource_id < upper_boundary_id)
    resources = get_full_resources_data(lower_boundary_id, end_resource_id)
    unless resources.nil?
      resources.each do |res|
        resource = {"name": res["resourceName"].downcase, "id": res["resourceID"], "content_partner_id": res["contentPartnerID"]}
        resource_repository.save(resource)
      end
    end
    lower_boundary_id = end_resource_id + 1
    end_resource_id += $batch_size 
  end
end

namespace :resources do
  desc "TODO"  
  task :get_all_resources=> :environment do
     get_resources
  end
  
end
