class ConfirmationsController < Devise::ConfirmationsController
  include ApplicationHelper

  private
    def after_confirmation_path_for(resource_name, resource)
      new_session_path(resource_name)
    end
end