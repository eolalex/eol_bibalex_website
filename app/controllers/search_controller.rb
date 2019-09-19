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
    @page_title = params[:query] == "*" ? t(:see_more) : params[:query]+ "| "+ t(:search_results)
    regex = ".*" + params[:query].downcase + ".*"
    page_result_scientific_names = search_pages(regex)
    page_result_vernaculars = search_vernaculars(regex)
    @pages = merge_results(page_result_scientific_names, page_result_vernaculars)

    if (params[:scientific_names] == "true" && params[:vernaculars] == "false")
      @results = @results + page_result_scientific_names
    elsif (params[:vernaculars] == "true" && params[:scientific_names] == "false")
      @results = @results + page_result_vernaculars
    else
      @results = @results + @pages
    end
    
    unless @results.empty?
      @results = @results.paginate( page: params[:page], per_page: ENV['per_page'])
    else
      flash[:notice] = t(:no_results) +" "+ params[:query]
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
  
  def search_vernaculars(regex)
    results = Vernacular.search params[:query] do |body|
      body[:query] = {
        regexp:{
           name_string: regex
          }
             }
    end
    results.map(&:page).uniq
  end
  
  def merge_results(page_result_scientific_names, page_result_vernaculars)
    @pages = Array.new
    page_result_scientific_names.results.each do |res|
      @pages << res
    end
    page_result_vernaculars.each do |res|
      @pages << res
    end
    pages = @pages
  end
  
end
 