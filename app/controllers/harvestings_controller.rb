class HarvestingsController < ApplicationController
  before_action :authenticate_user!
  before_action :validate_admin

  def index
    limit = (ENV['SCHEDULER_LIMIT']).to_i
    offset = 0
    harvests = HarvesterApi.get_harvest_records(3, offset, limit)
    if harvests.present?
      @rows = Array.new
      loop do
        @rows += harvests
        offset += limit
        harvests = HarvesterApi.get_harvest_records(3, offset, limit)
      break unless harvests.present?
      end
      @rows = @rows.sort_by{|row| row["resourceID"].to_i}
      @rows = @rows.paginate(page: params[:page], per_page: ENV['PER_PAGE_RESOURCES'])
    end
  end

  def self.current
    current_harvest = HarvesterApi.get_harvest_records(1, 0, 1).first
    if current_harvest.present?
      @row = current_harvest
    end
    @row
  end

  def pending
    limit = 1
    offset = 0
    harvests = HarvesterApi.get_harvest_records(2, offset, limit)
    if harvests.present?
      @rows = Array.new
      @rows += harvests
      @rows = @rows.paginate(page: params[:page], per_page: ENV['PER_PAGE'])
    end
  end

  def change_position
    HarvesterApi.change_position(params[:resource_id], params[:direction], params[:new_position])
    redirect_to pending_harvests_path
  end
  
  def swap
    HarvesterApi.swap(params[:first_resource_id], params[:second_resource_id])
    redirect_to pending_harvests_path
  end

  def move_to_end
    HarvesterApi.move_resource_to_end(params[:resource_id], params[:end_resource_id], params[:direction])
    redirect_to pending_harvests_path
  end

  def validate_admin
    unless current_user.role == 4
      flash[:notice] = "#{t(:admin_account_required)}"
      redirect_back(fallback_location: root_path)
    end
  end
end
