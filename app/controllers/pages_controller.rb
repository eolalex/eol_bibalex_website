class PagesController < ApplicationController
  include ApplicationHelper
  include PagesHelper
  before_action :authenticate_user!, only: [:index, :new]
  def index
  end

  def new
  end

  def show
    @page = Page.find(params[:id])
    # @collection = Collection.new(id: 1)
    # @page_title = @page.name
    @page_title = @page.scientific_name
    respond_to do |format|
      format.html {}
    end
  end

  def collect
  end

  def autocomplete
    render json: Page.search(params[:query], {
      fields: ["scientific_name^5"],
      match: :word_start,
      # limit: 10,
      load: false,
      misspellings: false
    })
  end

  def media

    @page = Page.where(id: params[:page_id]).first
  # media = @page.media_without_maps
  # @subclasses = @page.media.pluck(:subclass).uniq.compact
  # @subclasses << "any type"
  # if params[:subclass] && params[:subclass] != "any type"
  # @subclass = params[:subclass]
  # media = media.where(subclass: params[:subclass])
  # end
  # @media = media.paginate(:page => params[:page], :per_page => ENV['per_page'])
  # @media=media
  end

  def media_grid
    @page = Page.where(id: params[:page_id]).first
    if params[:maps] == "true"
      maps
    else
      # media = @page.media_without_maps
      # media_without_tif=media.reject { |hash| hash[:base_url].include?(".tif") }
      # @media = media_without_tif.paginate(:page => params[:page], :per_page => ENV['per_page'])
      options =  Hash.new
      options[:index] = "page_contents_medium"
      options[:type] = "_doc"
      options[:size] = 1000
      options[:body]= {query: {match: {'page_id': params[:page_id]}}}
      page_contents_json = PageContent.__elasticsearch__.client.search(options)["hits"]["hits"].to_a.map{|r| r["_source"]}.to_json
      @page_contents = JSON.parse(page_contents_json, object_class:PageContent).paginate(:page => params[:page], :per_page => ENV['per_page'])
    end

    render :partial => "media_grid"
  end

  def articles
    @page = Page.where(id: params[:page_id]).first
  # @articles = @page.articles
  # @articles = @articles.paginate(:page => params[:page], :per_page => ENV['per_page'])
  end

  def articles_tab
    @page = Page.where(id: params[:page_id]).first
    @articles = @page.articles
    @articles = @articles.paginate(:page => params[:page], :per_page => ENV['per_page'])
    render :partial => "articles"
  end

  def maps
    @page = Page.where(id: params[:page_id]).first
    @maps = @page.maps
    @media = @maps
    @media = @media.paginate(:page => params[:page], :per_page => ENV['per_page'])
  end

  # def maps
  # @page = Page.where(id: params[:page_id]).first
  # # NOTE: sorry, no, you cannot choose the page size for maps.
  # @media = @page.maps
  # unless @media.nil?
  # @media = @media.paginate(:page => params[:page], :per_page => ENV['per_page'])
  # end
  # @subclass = "map"
  # @subclass_id = Medium.subclasses[:map]
  # return render(status: :not_found) unless @page # 404

  # respond_to do |format|
  # format.html {}
  # format.js {}
  # end
  # end
  # def show
  # @page = Page.find_by_id(params[:id])

  # respond_to do |format|
  # format.html {}
  # format.js {}
  # end
  # end

  def literature_and_references
    @page = Page.where(id: params[:page_id]).first
  end

  def literature_and_references_tab
    @page = Page.where(id: params[:page_id]).first
    render :partial => "literature_and_references"
  end

  def names
    @page = Page.find(params[:id])
    # @scientific_names = @page.scientific_names
    # @vernaculars = @page.vernaculars
    respond_to do |format|
      format.html {}
    end
  end

  def vernaculars_tab
    @page = Page.find(params[:page_id])
    @vernaculars = @page.vernaculars
    render :partial => "vernaculars"
  end

  def classification_tab
    @page = Page.find(params[:page_id])
    render :partial => "classification"
  end

  def scientific_names_tab
    @page = Page.find(params[:page_id])
    @scientific_names = @page.scientific_names
    render :partial => "scientific_names"
  end

  def data
    @page = Page.where(id: params[:page_id]).first
  # @resources = TraitBank.resources(@page.data)
  # predicates = @page.predicates
  # return render(status: :not_found) unless @page # 404
  # respond_to do |format|
  # format.html {}
  # format.js {}
  # end
  # @predicates = predicates.paginate(:page => params[:page], :per_page => ENV['per_page'])
  end

  def data_grid
    traits =[]
    @page = Page.where(id: params[:page_id]).first
    @resources = TraitBank.resources(@page.data)
    @resources_content_partners = get_content_partner_of_resources()
    predicates = @page.predicates
    #display predicates with same uri in sequence
    predicates.each_with_index do |uri, index|
    # returns resource, trait, predicate, object_term, units, sex_term, lifestage_term, statistical_method_term of page of predicate in form of predicate[:uri]
      @page.grouped_data[uri].each do |trait|
        traits << trait
      end
    end
    #@predicates = predicates.paginate(:page => params[:page], :per_page => ENV['per_page'])
    @traits = traits.paginate(:page => params[:page], :per_page => ENV['per_page'])
    return render(status: :not_found) unless @page # 404
    respond_to do |format|
      format.html {}
      format.js {}
    end
    render :partial => "data_grid"
  end

end

