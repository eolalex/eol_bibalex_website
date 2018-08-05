class SearchController < ApplicationController
  def index
    unless params[:query].nil?
      search
    end
  end
  
  def search
    # Page.reindex
    regex = ".*"+params[:query]+".*"
    # scientific_names_result = ScientificName.search params[:query] do |body|
      # body[:query] = {
        # regexp:{
            # canonical_form: regex
        # }
     # }
    # end
    # @scientific_names = scientific_names_result.results
    
    page_result = Page.search params[:query] do |body|
      body[:query] = {
        regexp:{
            scientific_name: regex
        }
     }
    end
    @pages = page_result.results
    
    # if params[:scientific_names]
      # @results = @scientific_names
    # end
    if params[:pages]
      @results.nil??  @results= @pages : @results +=@pages
    end
    if (params[:scientific_names].nil? && params[:pages].nil?)
      @results = @pages
    end
    @results = @results.paginate(:page => params[:page], :per_page => ENV['per_page'])
    # @results =@results.uniq!
  end
end