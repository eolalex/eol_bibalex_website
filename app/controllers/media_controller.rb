class MediaController < ApplicationController

  layout "application"
    
    def show
    @medium = Medium.where(id: params[:id]).first
    @license = @medium.license
  end

end