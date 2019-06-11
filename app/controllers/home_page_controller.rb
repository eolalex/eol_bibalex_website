class HomePageController < ApplicationController
  require 'net/http'

  #include ApplicationHelper
  #helper_method :url_without_locale_params
  
  def index
    unless fragment_exist?("#Home_Statistics")

      #cache number of resources
      httpRes = Net::HTTP.new(ENV['SCHEDULER_IP'], ENV['SCHEDULER_PORT'])
      reqRes = Net::HTTP::Get.new("#{ENV['schedular_ip']}/resources/count")
      @res_count = httpRes.request(reqRes).body
      
      #cache number of content partners
      httpCP = Net::HTTP.new(ENV['SCHEDULER_IP'], ENV['SCHEDULER_PORT'])
      reqCP = Net::HTTP::Get.new("#{ENV['schedular_ip']}/contentPartners/count")
      @cp_count = httpCP.request(reqCP).body

      # #cache number of resources
      # httpRes = Net::HTTP.new('127.0.0.1', '8084')
      # reqRes = Net::HTTP::Get.new("http://127.0.0.1:8084/scheduler/resources/count")
      # @res_count = httpRes.request(reqRes).body
# 
      # #cache number of content partners
      # httpCP = Net::HTTP.new('127.0.0.1', '8084')
      # reqCP = Net::HTTP::Get.new("http://127.0.0.1:8084/scheduler/contentPartners/count")
      # @cp_count = httpCP.request(reqCP).body

      #cache number of neo4j traits
      @traits_count = TraitBank.count

      #cache other statistics,too
      @user_count = User.count
      @media_count = Medium.count
      @collection_count = Collection.count
    end

  # @main_feed = HomePageFeed.find_by_name("main") || HomePageFeed.new
  # @partner_feed = HomePageFeed.find_by_name("partner") || HomePageFeed.new
  end
end
