class PagesController < ApplicationController
  include ApplicationHelper
  before_action :authenticate_user!, only: [:index, :new]
  def index
  end

  def new
  end

  def show
    @page = Page.find(params[:id])
    # @collection = Collection.new(id: 1)
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
    # media = @page.media
    # @subclasses = @page.media.pluck(:subclass).uniq.compact
    # @subclasses << "any type"
    # if params[:subclass] && params[:subclass] != "any type"
      # @subclass = params[:subclass]
      # media = media.where(subclass: params[:subclass])
    # end
    # @media = media.paginate(:page => params[:page], :per_page => ENV['per_page'])

  end
  
  def media_grid
    @page = Page.where(id: params[:page_id]).first
    media = @page.media
    # @subclasses = @page.media.pluck(:subclass).uniq.compact
    # @subclasses << "any type"
    # if params[:subclass] && params[:subclass] != "any type"
      # @subclass = params[:subclass]
      # media = media.where(subclass: params[:subclass])
    # end
    @media = media.paginate(:page => params[:page], :per_page => ENV['per_page'])
    render :partial => "media_grid"
  end
  
  def articles
    @page = Page.where(id: params[:page_id]).first
    @articles = @page.articles
    @articles = @articles.paginate(:page => params[:page], :per_page => ENV['per_page'])
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

  def names
    @page = Page.find(params[:id])
    @scientific_names = @page.scientific_names
    @vernaculars = @page.vernaculars
    respond_to do |format|
      format.html {}
    end
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
    @page = Page.where(id: params[:page_id]).first
    @resources = TraitBank.resources(@page.data)
    predicates = @page.predicates
    @predicates = predicates.paginate(:page => params[:page], :per_page => ENV['per_page'])
    return render(status: :not_found) unless @page # 404
    respond_to do |format|
      format.html {}
      format.js {}
    end
    render :partial => "data_grid"
  end

end
  

