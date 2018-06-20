class MediaController < ApplicationController

  def show
    @medium = Medium.where(id: params[:id]).includes(:license,
      :bibliographic_citation, :location, page_contents: { page: %w[native_node preferred_vernaculars] }, attributions: :role).first
  end
  
end