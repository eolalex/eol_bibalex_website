class PagesController < ApplicationController
  before_action :authenticate_user!, only: [:index, :new]

  def index
  end

  def new
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
    # return render(status: :not_found) unless @page # 404
    media = @page.media
    # if params[:license]
      # media = media.joins(:license).
        # where(["licenses.name LIKE ?", "#{params[:license]}%"])
      # @license = params[:license]
    # end
    # if params[:subclass_id]
      # media = media.where(subclass: params[:subclass_id])
      # @subclass_id = params[:subclass_id].to_i
      # @subclass = Medium.subclasses.find { |n, id| id == @subclass_id }[0]
    # end
    # if params[:resource_id]
      # media = media.where(resource_id: params[:resource_id])
      # @resource_id = params[:resource_id].to_i
      # @resource = Resource.find(@resource_id)
    # end
    @media = media.page(params[:page]).per_page(30)
    @page_contents = PageContent.where(content_type: "Medium", content_id: @media.map(&:id))
    respond_to do |format|
      format.html {}
      format.js {}
    end
  end
  
end
