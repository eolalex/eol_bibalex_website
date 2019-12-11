class UsersController < ApplicationController
  rescue_from 'Acl9::AccessDenied', with: :access_denied

  include ApplicationHelper
  before_action :configure_permitted_params, only: :create
  access_control do
    allow logged_in, only: :show
    allow :administrator, only: [:index, :edit, :update, :new, :create, :search]
  end

  def show
    @user = User.find(params[:id])
    @content_partner_ids = ContentPartnerUser.where("user_id = ?", params[:id]).pluck(:content_partner_id)
    @collections = @user.collections
  end

  def index
    @users = User.all.paginate(page: params[:page], per_page: ENV["per_page"].to_i)
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(
      username: params[:user][:username],
      password: params[:user][:password],
      password_confirmation: params[:user][:password_confirmation],
      email: params[:user][:email])

    @user.skip_confirmation!
    if @user.save
      flash[:notice] = t(:successfully_created)
      redirect_to users_path
    else
      flash[:notice] = t(:something_went_wrong)
      redirect_back fallback_location: root_path
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    @user.update_attributes(user_parameters)
    if @user.save
      flash[:notice] = t(:succesfully_updated)
      redirect_to users_path
    else
      flash[:notice] = t(:something_went_wrong)
      redirect_back fallback_location: root_path
    end
  end

  def configure_permitted_params
    params.require(:user).permit(:username, :email, :password, :password_confirmation)
  end

  def user_parameters
    params.require(:user).permit(:id, :username)
  end

  def search
    user_regex = ".*#{params[:users_query].downcase}.*"
    users = User.search params[:users_query] do |body|
      body[:query] = {
        regexp: {
          name: user_regex
        }
      }
    end
    @results = users.results
    if @results.empty?
      flash[:notice] = "#{t(:no_results)} #{params[:users_query]}"
      redirect_back fallback_location: root_path
    elsif params[:direction].present?
      @results = @results.sort do |user_1, user_2|
        user_1.username.downcase <=> user_2.username.downcase
      end
      @results = @results.reverse if params[:direction] == "desc"
      @results = @results.paginate(page: params[:page], per_page: ENV["per_page"].to_i)
    else
      @results = @results.paginate(page: params[:page], per_page: ENV["per_page"].to_i)
    end
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
