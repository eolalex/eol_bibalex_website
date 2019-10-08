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
    # Page.reindex
    @page_title = params[:query] == "*" ? t(:see_more) : params[:query]+ "| "+ t(:search_results)
    regex = ".*\"#{params[:query].downcase}\".*"
    page_result_scientific_names = search_pages(regex)
    content_partner_results = search_content_partners.results
    @pages = merge_results(page_result_scientific_names, content_partner_results)
    if params[:pages]
      @results.nil??  @results= @pages : @results +=@pages
    end
    if (params[:scientific_names].nil? && params[:pages].nil?)
      @results = @pages
    end
    unless @results.empty?
      @results = @results.paginate( page: params[:page], per_page: ENV['per_page'])
    else
      flash[:notice] = t(:no_results) +" "+ params[:query]
      redirect_back(fallback_location: root_path)
    end
  end
  
  def search_pages(regex)
    Page.search params[:query] do |body|
      body[:query] = {
        regexp:{
           name: regex
          }
        }
    end
  end
  
  def search_content_partners
    $content_partner_repository.search( query: { match_phrase_prefix: { name: params[:query]}})
  end
  
  def merge_results(page_result_scientific_names, content_partner_results)
    @pages = Array.new
    @pages += page_result_scientific_names  
    @pages += content_partner_results
    pages = @pages.uniq
  end

end