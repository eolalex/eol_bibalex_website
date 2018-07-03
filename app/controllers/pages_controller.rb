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
    @subclasses = @page.media.pluck(:subclass).uniq
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

end
