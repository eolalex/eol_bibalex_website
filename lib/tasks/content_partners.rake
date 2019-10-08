#This is to get all the existing content_partners from the Scheduler database and save them into the content_partner repository
#Ideally, this should be run only once when deploying the new feature to the servers

def get_full_content_partners_data(lower_boundary_id, end_content_partner_id)
  begin
    request = RestClient::Request.new(
      method: :get,
      url: "#{$base_scheduler_uri}/#{$get_all_content_partners_uri}/#{lower_boundary_id}/#{end_content_partner_id}"
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
      url: "#{$base_scheduler_uri}/#{$get_content_partner_ids_uri}"
      )
      response = JSON.parse(request.execute)
    rescue => e
      nil
  end
end

def get_content_partners
  # first, we should get first and last content partner ids to split the reponse into batches
  $base_scheduler_uri = "#{SCHEDULER_IP}"
  $get_all_content_partners_uri = "#{GET_FULL_CPS_DATA}"
  $get_content_partner_ids_uri = "#{GET_CP_BOUNDARIES}"
  $batch_size = "#{BATCH_SIZE}".to_i
  $content_partner_repository = ContentPartnerRepository.new(index_name: :content_partners, type: :content_partner, klass: ContentPartner)
  $content_partner_repository.create_index!
  boundary_ids = get_boundary_ids
  unless boundary_ids.nil?
    lower_boundary_id = boundary_ids["firstContentPartnerId"]
    upper_boundary_id = boundary_ids["lastContentPartnerId"] + $batch_size
  end
  # debugger
  end_content_partner_id = lower_boundary_id + $batch_size
  while( end_content_partner_id < upper_boundary_id)
    content_partners = get_full_content_partners_data(lower_boundary_id, end_content_partner_id)
    unless content_partners.nil?
      content_partners.each do |cp|
        # debugger
        content_partner = {"name": cp["contentPartnerName"].downcase, "id": cp["contentPartnerID"]}
        $content_partner_repository.save(content_partner)
      end
    end
    lower_boundary_id = end_content_partner_id + 1
    end_content_partner_id += $batch_size 
  end
end

namespace :content_partners do
  desc "TODO"  
  task :get_all_content_partners=> :environment do
     get_content_partners
  end
  
end