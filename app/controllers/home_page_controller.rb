class HomePageController < ApplicationController
  
  #include ApplicationHelper
  #helper_method :url_without_locale_params
  def index
    # @main_feed = HomePageFeed.find_by_name("main") || HomePageFeed.new
    # @partner_feed = HomePageFeed.find_by_name("partner") || HomePageFeed.new
  end
end
