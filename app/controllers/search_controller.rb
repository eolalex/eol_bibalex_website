class SearchController < ApplicationController
  include ApplicationHelper
  
  def index
    unless (params[:query].nil?)
      unless (params[:query].empty?)
        search
      end
    end
  end

  def search
    @page_title = params[:query] == "*" ? t(:see_more) : params[:query] + "| " + t(:search_results)
    regex = ".*" + params[:query].downcase + ".*"
    page_result_scientific_names = search_pages(regex)
    collection_results = search_collections(regex)
    @pages = merge_results(page_result_scientific_names, collection_results)

    if params[:pages]
      @results.nil??  @results = @pages : @results += @pages
    end
    if (params[:scientific_names].nil? && params[:pages].nil?)
      @results = @pages
    end
    unless @results.empty?
      @results = @results.paginate( page: params[:page], per_page: ENV['per_page'])
    else
      flash[:notice] = t(:no_results) + " " + params[:query]
      redirect_back(fallback_location: root_path)
    end
  end
  
  def search_pages(regex)
    Page.search params[:query] do |body|
      body[:query] = {
        regexp:{
           name_string: regex
          }
        }
    end
  end
  
  def search_collections(regex)
    Collection.search params[:query] do |body|
      body[:query] = {
        regexp:{
           name_string: regex
          }
        }
    end
  end
  
  def merge_results(page_result_scientific_names, collection_results)
    # debugger
    @pages = Array.new
    @pages += page_result_scientific_names  
    @pages += collection_results
    pages = @pages.uniq
  end
      
end
