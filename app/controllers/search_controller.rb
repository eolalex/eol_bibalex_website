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
    @results = Array.new
    @page_title = params[:query] == "*" ? t(:see_more) : params[:query] + "| " + t(:search_results)
    regex = ".*" + params[:query].downcase + ".*"
    page_result_scientific_names = search_pages(regex)
    media_results = search_media(regex)
    @pages = merge_results(page_result_scientific_names, media_results)

    if (params[:scientific_names] == "true" && params[:media] == "false")
      @results += page_result_scientific_names
    elsif (params[:media] == "true" && params[:scientific_names] == "false")
      @results += media_results
    else
      @results += @pages
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
  
  def search_pages(regex)
    Page.search params[:query] do |body|
      body[:query] = {
        regexp:{
           name_string: regex
          }
        }
    end
  end
  
  def search_media(regex)
    Medium.search params[:query] do |body|
      body[:query] = {
        regexp:{
           name_string: regex
          }
        }
    end
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

  def merge_results(page_result_scientific_names, media_results)
    @pages = Array.new
    @pages += page_result_scientific_names  
    @pages += media_results
    pages = @pages.uniq
  end
  
end