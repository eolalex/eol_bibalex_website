class PagesController < ApplicationController
  before_action :authenticate_user!, only: [:index, :new]
  def index
  end

  def new
  end

  def show
    @page = Page.find(params[:id])
    # @page_title = @page.name
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
      limit: 10,
      load: false,
      misspellings: false
    })
  end
  
  def media
    @page = Page.where(id: params[:page_id]).first
    media = @page.media
    @subclasses = @page.media.pluck(:subclass).uniq.compact
    @subclasses << "any type"
    if params[:subclass] && params[:subclass] != "any type"
      @subclass = params[:subclass]
      media = media.where(subclass: params[:subclass])
    end
    @media = media.page(params[:page]).per_page(30)
    respond_to do |format|
      format.html {}
      format.js {}
    end
  end
  
  def show
    @page = Page.find_by_id(params[:id])
    respond_to do |format|
      format.html {}
      format.js {}
    end
  end
  
  def literature_and_references
    @page = Page.where(id: params[:page_id]).first
  end

  def names
    @page = Page.find(params[:id])
    @scientific_names = @page.scientific_names
    @vernaculars = @page.vernaculars
    @scientific_names_resources = {}
    @vernaculars_resources = {}
    
    @scientific_names.each do |name|
      resource_id = name.resource_id
      @key = name.canonical_form
      resource = ResourceApi.get_resource_using_id(resource_id)
      resource_info =  Resource.new(id: resource["id"].to_i, name: resource["name"], origin_url: resource["origin_url"], type: resource["type"], path: resource["path"])
      @scientific_names_resources[@key] = resource_info 
      #here I want to check if the name exists in hash already then append to it otherwise just add new element
      end
      
    end
    
    if !@vernaculars.nil? && !@vernaculars.empty?
      @vernaculars.each do |name|
        resource_id = name.resource_id
        resource = ResourceApi.get_resource_using_id(resource_id)
        resource_info =  Resource.new(id: resource["id"].to_i, name: resource["name"], origin_url: resource["origin_url"], type: resource["type"], path: resource["path"])
        @vernaculars_resources[name] = resource_info
        #here I want to check if the name exists in hash already then append to it otherwise just add new element
      end
    end
    
    respond_to do |format|
      format.html {}
    end
  end
  
  def data
    @page = Page.where(id: params[:page_id]).first
    @resources = TraitBank.resources(@page.data)
    return render(status: :not_found) unless @page # 404
    respond_to do |format|
      format.html {}
      format.js {}
    end
  end
  

