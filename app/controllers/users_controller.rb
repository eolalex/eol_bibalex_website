class UsersController < ApplicationController
  # include Refinery::Admin::BaseController

  include ApplicationHelper
  before_action :set_locale
  helper_method :url_without_locale_params
  def set_locale
    # I18n.locale = params[:locale] || I18n.default_locale
  end

  def show
    @user = User.find(params[:id])
    @content_partner_ids = ContentPartnerUser.where("user_id = ?", params[:id]).pluck(:content_partner_id)
    @content_partner_ids = @content_partner_ids.paginate(page: params[:page_cp], per_page: ENV['per_page_user']
    @collections = @user.collections
    @collections = @collections.paginate(page: params[:page_collection], per_page: ENV['per_page_user'].to_i)
  end
end
