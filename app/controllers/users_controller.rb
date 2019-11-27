class UsersController < ApplicationController
  include ApplicationHelper
  helper_method :url_without_locale_params

  def show
    @user = User.find(params[:id])
    @content_partner_ids = ContentPartnerUser.where("user_id = ?", params[:id]).pluck(:content_partner_id)
    @collections = @user.collections
  end
end
