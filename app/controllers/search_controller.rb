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
    media_results = search_media(regex)
    @media_results_pages_ids = media_results.present? ? get_media_pages_ids(media_results) : nil
    @pages = merge_results(page_result_scientific_names, media_results)

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
  
  def search_media(regex)
    Medium.search params[:query] do |body|
      body[:query] = {
        regexp:{
           name_string: regex
          }
        }
    end
  end
  
  def get_media_pages_ids(media_results)
    @media_pages_ids = Hash.new
    page_ids = Array.new
    media_results.each do |result|
      PageContent.where(content_id: result.id).each do |page_content|
        page_ids << page_content.page_id
      end
      @media_pages_ids[result.id] = page_ids
    end
    media_pages_ids = @media_pages_ids
  end 

  def merge_results(page_result_scientific_names, media_results)
    @pages = Array.new
    @pages += page_result_scientific_names  
    @pages += media_results
    pages = @pages.uniq
  end

end