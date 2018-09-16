class DataController < ApplicationController
  include ApplicationHelper
  helper :data
  helper_method :url_without_locale_params
  protect_from_forgery
  def show
    @data = TraitBank.by_trait(params[:id]).first
    @resources = TraitBank.resources([@data])
    @page = Page.find(@data[:page_id])
    @show_taxon = params[:show_taxon] && params[:show_taxon] == "true"
    render :layout => false
  end
end
