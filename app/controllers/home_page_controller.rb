class HomePageController < ApplicationController
  include HomePageHelper

  def index
    get_statistics
  end

  def self.image_found(page)
    page.try(:media).size > 0 && !page.try(:media).first.base_url.nil?
  end
end
