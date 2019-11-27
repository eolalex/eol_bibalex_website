module HomePageHelper

  def get_statistics
    unless fragment_exist?("#Home_Statistics-#{locale}-#{$updated_at}")
      #cache number of resources
      begin
        request = RestClient::Request.new(
          method: :get,
          url: "#{ENV['schedular_ip']}/resources/count"
        )
        @resources_count = JSON.parse(request.execute)
      rescue => e
        nil
      end

      #cache number of content partners
      begin
        request = RestClient::Request.new(
          method: :get,
          url: "#{ENV['schedular_ip']}/contentPartners/count"
        )
        @content_partners_count = JSON.parse(request.execute)
      rescue => e
        nil
      end

    #cache number of neo4j traits
    @traits_count = TraitBank.count

    #cache other statistics,too
    @user_count = User.count
    @media_count = Medium.count
    @collection_count = Collection.count
    end
  end
end