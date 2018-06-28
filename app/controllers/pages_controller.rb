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

end
