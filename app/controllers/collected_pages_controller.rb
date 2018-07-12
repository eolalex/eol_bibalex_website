class CollectedPagesController < ApplicationController
  layout "application"
  before_action :authenticate_user!
  def index
    if params[:q]
      @results = CollectedPage.find_pages(params[:q], params[:collection_id])
    else
      @collection = Collection.find(params[:collection_id])
    end
  end

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
      respond_to do |fmt|
        fmt.html do
          flash[:notice] = "Page Added to Collection"
        end
        fmt.js { }
      end
      redirect_to @collected_page.page
    end
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
    @canonical_form = params[:canonical_form]
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
