class HomePageController < ApplicationController
  include HomePageHelper

  def index
    get_statistics
  end
end
