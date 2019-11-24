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
    filter_parameters = ["scientific_names", "vernaculars", "collections", "media"]
    no_filter = true
    
    # check if all search filter paramters are null, i.e. if this is the first search run or filters are cleared
    filter_parameters.each do |filter|
      break unless no_filter
      filter_param = params["#{filter}"]
      no_filter &= (filter_param.nil? || filter_param == "false")
    end
    
    filter_parameters.each do |filter|
      if params["#{filter}"] == "true" || no_filter
        @results += send("search_#{filter}")
      end
    end
    
    if no_filter
      @results += search_resources.results
      @results += search_content_partners.results
    end
    # debugger
    if no_filter && @results.empty?
      flash[:notice] = t(:no_results) + " " + params[:query]
      redirect_back(fallback_location: main_app.root_path)
    elsif no_filter && !(@results.empty?)
      @results = @results.uniq.paginate( page: params[:page], per_page: ENV['per_page'])
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
    
  def search_media
    regex = ".*" + params[:query].downcase + ".*"
    results = Medium.search params[:query] do |body|
      body[:query] = {
        regexp:{
           name_string: regex
          }
        }
    end
    results
  end
  
  def search_resources
    $resource_repository.search( query: { match_phrase_prefix: { name: params[:query]}})
  end
  
  def search_content_partners
    $content_partner_repository.search( query: { match_phrase_prefix: { name: params[:query]}})
  end

  def self.get_medium_pages_ids(media_result)
    @media_pages_ids = Array.new
    page_ids = Array.new
    PageContent.where(content_id: media_result.id).each do |page_content|
      page_ids << page_content.page_id
    end
    @medium_pages_ids = page_ids
    medium_pages_ids = @medium_pages_ids
  end 
  
end
  

