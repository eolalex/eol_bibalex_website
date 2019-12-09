class UsersController < ApplicationController
  rescue_from 'Acl9::AccessDenied', with: :access_denied
  
  include ApplicationHelper
  access_control do
    allow logged_in, only: :show
    allow :administrator, only: :index
  end

  def show
    @user = User.find(params[:id])
    @content_partner_ids = ContentPartnerUser.where("user_id = ?", params[:id]).pluck(:content_partner_id)
    @collections = @user.collections
  end
  
  def index
    @users = User.all.paginate(page: params[:page], per_page: 2)
  end
  
  protected
    def access_denied
      if current_user
        flash[:notice] = t(:admin_account_required)
        redirect_back fallback_location: root_path
      else
        authenticate_user!
      end
    end
end
