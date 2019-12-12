class UsersController < ApplicationController
  require 'csv'
  require 'json'

  include ApplicationHelper

  rescue_from 'Acl9::AccessDenied', with: :access_denied

  before_action :configure_permitted_params, only: :create
  access_control do
    allow logged_in, only: :show
    allow :administrator, only: [:index, :edit, :update, :new, :create, :search,
      :activate, :confirm, :export]
  end

  def show
    @user = User.find(params[:id])
    @content_partner_ids = ContentPartnerUser.where("user_id = ?", params[:id]).pluck(:content_partner_id)
    @collections = @user.collections
  end

  def index
    @users = User.all.paginate(page: params[:page], per_page: ENV["per_page"].to_i)
    $user_list = @users.as_json
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

  def confirm
    @user = User.find(params[:id])
  end

  def activate
    @user = User.find(params[:id])
    @user.update(confirmed_at: Time.now)
    if @user.save
      flash[:notice] = t(:successfully_activated)
      redirect_to users_path
    else
      flash[:notice] = t(:something_went_wrong)
      redirect_back fallback_location: root_path
    end
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
    @users = users.results
    if @users.empty?
      flash[:notice] = "#{t(:no_results)} #{params[:users_query]}"
      redirect_back fallback_location: root_path
    else
      if params[:direction].present?
        @users = @users.sort do |user_1, user_2|
          user_1.username.downcase <=> user_2.username.downcase
        end
        @users = @users.reverse if params[:direction] == "desc"
        @users = @users.paginate(page: params[:page], per_page: ENV["per_page"].to_i)
      else
        @users = @users.paginate(page: params[:page], per_page: ENV["per_page"].to_i)
      end
      $user_list = @users.as_json
    end
  end

  def export
    csv = ""
    csv << $user_list.first.keys.to_csv
    $user_list.each do |user| #open json to parse
      csv << user.values.to_csv
    end
    send_data(csv, type: 'text/csv', filename: ENV['USER_LIST_FILENAME'])
  end

  def configure_permitted_params
    params.require(:user).permit(:username, :email, :password, :password_confirmation, :confirmed_at)
  end

  def user_parameters
    params.require(:user).permit(:id, :username)
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
