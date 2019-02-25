class UsersController < ApplicationController
  include ApplicationHelper
  before_action :set_locale
  helper_method :url_without_locale_params
  def set_locale
    # I18n.locale = params[:locale] || I18n.default_locale
  end

  def show
    @user = User.find(params[:id])
    @content_partner_ids = ContentPartnerUser.where("user_id = ?", params[:id]).pluck(:content_partner_id)
    @collections = @user.collections
  end
end
