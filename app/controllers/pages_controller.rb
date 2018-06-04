class PagesController < ApplicationController
  
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
