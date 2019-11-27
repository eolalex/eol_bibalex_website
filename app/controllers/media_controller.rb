class MediaController < ApplicationController
  layout "application"
  include ApplicationHelper

  def show
    @medium = Medium.where(id: params[:id]).first
    @license = @medium.license
  end
end
