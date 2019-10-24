def main_method_resizing
  harvest_time = HarvestImageTime.first.last_time
  converted_harvest_time = (((harvest_time.to_f).round(3))*1000).to_i
  updated_time = Time.now
  # 1 is media status    
  image_resized_resources_json = get_image_resized_resources(converted_harvest_time, 1)
 # image_resized_resources = [{:"id"=>1,:"resource_id"=>532,:"media_status"=>"succeed"},{:"id"=>2,:"resource_id"=>155,:"media_status"=>"succeed"},{:"id"=>4,:"resource_id"=>154,:"media_status"=>"succeed"}]
  if (image_resized_resources_json != false) && (!image_resized_resources_json.nil?) && (!image_resized_resources_json.eql?(""))
    image_resized_resources = JSON.parse(image_resized_resources_json)
    image_resized_resources.each do |resource|
      harvest_id = resource["id"]
      resource_id = resource["resource_id"]
      limit = 10000
      offset = 0
      media_of_resource = get_media_of_resource(resource_id, limit, offset)
      while(media_of_resource != false && !media_of_resource.nil? && !media_of_resource.eql?(""))
        image_info_array = Array.new()
        image_info_count = 0
        media_of_resource_array = JSON.parse(media_of_resource)
        offset = (media_of_resource_array.last)["id"]
        media_of_resource_array.each do|medium|
          unless medium["sizes"].nil?
            res = ImageInfo.where(medium_id: medium["id"])
            unless res.size > 0
              sizes = medium["sizes"].split(',')
              large_size = nil
              medium_size = nil
              small_size = nil
              sizes.each do |size|
                if size.eql?("580X360") 
                  large_size = "580X360"
                elsif size.eql?("260X190")
                  medium_size = "260X190"
                elsif size.eql?("98X68")
                  small_size = "98X68"
                end
              end 
              # ImageInfo.create(resource_id: resource_id, original_size: "original", large_size: large_size,
              # medium_size: medium_size, small_size: small_size,resource_pk: medium["resource_pk"] ,medium_id: medium["id"], harv_db_id: harvest_id)
              image_info_array.insert(image_info_count, {:resource_id => resource_id, :original_size => "original", :large_size => large_size,:medium_size => medium_size,
                                                         :small_size => small_size, :resource_pk => medium["resource_pk"], :medium_id => medium["id"], :harv_db_id => harvest_id})
              image_info_count = image_info_count + 1
            end
          end
        end
        ImageInfo.bulk_insert(image_info_array,:validate => true)
        media_of_resource = get_media_of_resource(resource_id, limit, offset)
      end
    end
    HarvestImageTime.first.update_attribute(:last_time, updated_time)
  end
end

# last_time is the time of last time calling this request
def get_image_resized_resources(last_time, media_status)
  begin
    request = RestClient::Request.new(
      method: :get,
      timeout: -1,
      url: "#{GET_IMAGE_RESIZED_RESOURCES}/#{last_time}/#{media_status}"
    )
    response = request.execute
    response.body
  rescue => e
    false
  end
end

def get_media_of_resource(resource_id, limit, offset)
  begin
    request = RestClient::Request.new(
      method: :get,
      timeout: -1,
      url: "#{MYSQL_ADDRESS}/#{GET_MEDIA_OF_RESOURCE}/#{resource_id}/#{limit}/#{offset}"
    )
    response = request.execute
    response.body
  rescue => e
    false
  end
end

namespace :resizing do
  desc "TODO"
  task :images => :environment do
    main_method_resizing
  end
end
