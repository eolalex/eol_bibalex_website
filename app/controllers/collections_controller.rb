class CollectionsController < ApplicationController
  include ApplicationHelper
  before_action :authenticate_user!

  def new
    @collection = Collection.new
  end

  def create
    @page_id = request.referrer.split("/pages/")[1].split("?")[0].to_i
    @collection = Collection.new(collection_params)
    if @collection.save
      $updated_at = DateTime.now().strftime("%Q")
      @collection.users << current_user
      respond_to do |format|
        format.html {}
        format.js {}
      end
      @collected_page = CollectedPage.new(page_id: @page_id, collection_id: @collection.id)
      if @collected_page.save
        redirect_to @collected_page.page
        flash[:notice] = "#{@collected_page.scientific_name_string }: " + t(:page_added_to_collection) + ": #{@collected_page.collection.name}"
      end
    end
  end

  def edit
    @collection = Collection.find(params[:id])
  end

  def update
    @collection = Collection.find(params[:id])
    if @collection.update_attributes(collection_params)
     flash[:success] = t(:successfully_updated)
    else
     flash[:error] = t(:update_failed)
    end
    redirect_to @collection
  end

  def show
    @collection = Collection.find(params[:id])
    @collected_pages = @collection.collected_pages
    @collected_pages = @collected_pages.sort_by{|collected_page| collected_page.scientific_name_string.downcase}
    @collected_pages = @collected_pages.paginate(page: params[:page], per_page: ENV['PER_PAGE'])
  end

  def destroy
    @collection = Collection.find(params[:id])
    @user = current_user
    if @collection.destroy
      flash[:notice] = t(:collection_deleted)
      redirect_to user_path(current_user)
    end
    $updated_at = DateTime.now().strftime("%Q")
  end

  def self.image_found(collected_page) 
    Page.find_by_id(collected_page.page_id).try(:media).size > 0 && 
    !Page.find_by_id(collected_page.page_id).try(:media).first.base_url.nil?
  end
  
  def collection_params
    params.require(:collection).permit(:id, :name, :description, :collection_type, :default_sort,
      collected_pages_attributes: [:id, :page_id, :annotation,
        collected_pages_media_attributes: [:medium_id, :collected_page_id, :_destroy]])
  end
end
