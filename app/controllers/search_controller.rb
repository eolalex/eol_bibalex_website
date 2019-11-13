class SearchController < ApplicationController
  include ApplicationHelper
  
  def index
    if params[:query].present?
      search
    end
  end

  def search
    @results = Array.new
    @page_title = params[:query] == "*" ? t(:see_more) : params[:query] + "| " + t(:search_results)
    parameters = ["scientific_names", "vernaculars", "collections"]
      # , "media"]
    no_filter = true
    
    # check if all search filter paramters are null, i.e. if this is the first search run
    parameters.each do |parameter|
      break unless no_filter
      no_filter &= params["#{parameter}"].nil?
    end
    
    parameters.each do |parameter|
      if params["#{parameter}"] == "true" || no_filter
        @results += send("search_#{parameter}")
      end
    end
    
    unless @results.empty?
      @results = @results.paginate( page: params[:page], per_page: ENV['per_page'])
    else
      flash[:notice] = t(:no_results) + " " + params[:query]
      redirect_back(fallback_location: root_path)
    end
    
    respond_to do |format|
      format.js
      format.html
    end
  end
  
  def search_scientific_names
    regex = ".*" + params[:query].downcase + ".*"
    results = Page.search params[:query] do |body|
      body[:query] = {
        regexp:{
           name_string: regex
          }
        }
    end
    results
  end
  
  def search_vernaculars
    regex = ".*" + params[:query].downcase + ".*"
    results = Array.new
    vernacular_results = Vernacular.search params[:query] do |body|
      body[:query] = {
        regexp:{
           name_string: regex
          }
        }
    end
    vernacular_results.each do |vernacular|
      results << vernacular.page
    end
    results
  end
  
  def search_collections
    regex = ".*" + params[:query].downcase + ".*"
    results = Collection.search params[:query] do |body|
      body[:query] = {
        regexp:{
           name_string: regex
          }
        }
    end
    results
  end
  
end

