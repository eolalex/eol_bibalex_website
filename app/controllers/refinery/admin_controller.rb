# Filters added to this controller apply to all controllers in the refinery backend.
# Likewise, all the methods added will be available for all controllers in the refinery backend.
module Refinery
  class AdminController < ::ActionController::Base
    include ::Refinery::ApplicationController
    helper Refinery::Core::Engine.helpers
    include Refinery::Admin::BaseController
    before_action :check_if_admin
    def check_if_admin
      #debugger
      if ((request.original_fullpath == refinery.admin_root_path) || (request.original_fullpath == "#{refinery.admin_root_path}/pages"))
        if current_user.nil?
          authenticate_user!
        else
          unless current_user.role == 4
            flash[:notice] = "#{t(:admin_account_required)}"
            redirect_to root_path
          end
        end
      end
    end
  end
end
