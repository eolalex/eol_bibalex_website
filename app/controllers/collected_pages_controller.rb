class CollectedPagesController < ApplicationController
  include ApplicationHelper
  layout "application"
  before_action :authenticate_user!
  helper_method :url_without_locale_params
  
  # def index
    # if params[:q]
      # @results = CollectedPage.find_pages(params[:q], params[:collection_id])
    # else
      # @collection = Collection.find(params[:collection_id])
    # end
  # end
  
  def show
    @collected_page = CollectedPage.find(params[:id])
    respond_to do |format|
      format.js {}
    end
  end

  def new
    @collected_page = CollectedPage.new(new_page_params)
    @page = @collected_page.page
    @collection = Collection.new(collected_pages: [@collected_page])
    respond_to do |format|
      format.html {}
      format.js {}
    end
  end

  def create
    @collected_page = CollectedPage.find_or_initialize_by(existing_collected_page_params)
    is_new_page = @collected_page.new_record?
    if @collected_page.save
      if is_new_page
        respond_to do |f|
          f.html {}
          f.js {}
        end
        flash[:notice] = "Page Added to Collection"
      else
        flash[:notice] = "Page Already Exists in This Collection"
      end
    end
    redirect_to @collected_page.page
  end

  def destroy
    @collected_page = CollectedPage.find(params[:id])
    @page = @collected_page.page
    if @collected_page.destroy
      flash[:notice] = "Page Deleted"
    end
    redirect_to @collected_page.collection
  end

  def index
    @collection_id = params[:collection_id]
    @collected_pages = CollectedPage.where(collection_id: @collection_id)
    @canonical_form = params[:q]
    @collected_pages.each do |collected_page|
  # assumtion scientific name has only one page
      @scientific_names = collected_page.page.scientific_names
      @scientific_names.each do|scientific_name|
        if scientific_name[:canonical_form].downcase.start_with?(@canonical_form.downcase)
          if @result.nil?
             @result= Array.new
           end
          @result << scientific_name
        end
      end
    end
    unless @result.nil?
      @result = @result.sort_by{|collected_page| collected_page.page.scientific_name.downcase}
      @result = @result.paginate(:page => params[:page], :per_page => ENV['per_page'])
    else
     flash[:notice] = "No Results Found"
     redirect_to collection_path(id: @collection_id)
    end
    
    # @scientific_names= if params[:canonical_form]
      # ScientificName.where('canonical_form LIKE ?', "#{params[:canonical_form]}%")
    # end
  end

  private

  def collected_page_params
    params.require(:collected_page).permit(:id, :collection_id, :page_id, :annotation)
  end

  def existing_collected_page_params
    params.require(:collected_page).permit(:id, :collection_id, :page_id)
  end

  def new_page_params
    params.permit(:page_id)
  end
end
