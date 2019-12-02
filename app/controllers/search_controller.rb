class SearchController < ApplicationController
  include ApplicationHelper

  def index
    if params[:query].present?
      search
    end
  end

  def search
    @page_title = params[:query] == "*" ? t(:see_more) : params[:query]+ "| " + t(:search_results)
    regex = ".*\"" + params[:query].downcase + "\".*"
    page_result = Page.search params[:query] do |body|
      body[:query] = {
        regexp:{
          scientific_name: regex
        }
      }
    end

    @pages = page_result.results
    if params[:pages]
      @results.nil??  @results= @pages : @results +=@pages
    end
    if (params[:scientific_names].nil? && params[:pages].nil?)
      @results = @pages
    end
    unless @results.empty?
      @results = @results.paginate( page: params[:page], per_page: ENV['PER_PAGE'])
    else
      flash[:notice] = t(:no_results) + " " + params[:query]
      redirect_back(fallback_location: root_path)
    end
  end
end

