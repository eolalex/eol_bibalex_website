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
  
  def names
    @page = Page.find(params[:id])
    respond_to do |format|
      format.html {}
    end
  end
  
end
