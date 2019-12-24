#This is to get all the existing content_partners from the Scheduler database and save them into the content_partner repository
#Ideally, this should be run only once when deploying the new feature to the servers

def get_full_content_partners_data(offset, limit)
  begin
    request = RestClient::Request.new(
      method: :get,
      url: "#{$base_scheduler_uri}/#{$get_all_content_partners_uri}/#{offset}/#{limit}"
    )
    response = JSON.parse(request.execute)
    rescue => e
      nil
    end
end

def get_content_partners
  $base_scheduler_uri = "#{SCHEDULER_IP}"
  $get_all_content_partners_uri = "#{GET_FULL_CPS_DATA}"
  $content_partner_repository = ContentPartnerRepository.new(index_name: :content_partners, type: :content_partner, klass: ContentPartner)
  $content_partner_repository.create_index!
  limit = ("#{SCHEDULER_LIMIT}").to_i
  offset = 0
  loop do
    content_partners = get_full_content_partners_data(offset, limit)
    unless content_partners.nil?
      content_partners.each do |cp|
        content_partner = {"name": cp["contentPartnerName"].downcase, "id": cp["contentPartnerID"]}
        $content_partner_repository.save(content_partner)
      end
    end
    offset += limit
    break unless content_partners.present?
  end
end

namespace :content_partners do
  desc "TODO"  
  task :get_all => :environment do
     get_content_partners
  end
  
end