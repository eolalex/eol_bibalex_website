class PagesController < ApplicationController
  before_action :authenticate_user!, only: [:index, :new]
  def index
  end

  def new
  end

  def show
    @page = Page.where(params[:page_id])
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
    @resources = TraitBank.resources(@page.data)
    return render(status: :not_found) unless @page # 404
    respond_to do |format|
      format.html {}
      format.js {}
    end
  end
  
 end

