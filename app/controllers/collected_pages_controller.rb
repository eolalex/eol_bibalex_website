class CollectedPagesController < ApplicationController
  include ApplicationHelper
  layout "application"
  before_action :authenticate_user!
  def show
    @collected_page = CollectedPage.find(params[:id])
    respond_to do |format|
      format.js {}
    end
  end

  def new
    # @collected_page = CollectedPage.new(new_page_params)
    # debugger
    # @page = @collected_page.page
    # @collection = Collection.new(collected_pages_attributes: [@collected_page])
    @collected_page = CollectedPage.new
  # respond_to do |format|
  # format.html {}
  # format.js {}
  # end
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
        flash[:notice] = t(:page_added_to_collection)
      else
        flash[:notice] = t(:page_exists)
      end
    end
    redirect_to @collected_page.page
  end

  def destroy
    @collected_page = CollectedPage.find(params[:id])
    @page = @collected_page.page
    @collection = @collected_page.collection
    if @collected_page.destroy
      if @collection.collected_pages_count == 1
        Collection.destroy(@collection.id)
        redirect_to @page
      else
        redirect_to @collection
      end
      flash[:notice] = t(:page_deleted)
    end
  end

  def index
    #debugger
    @collection_id = params[:collection_id]
    @collected_pages = CollectedPage.where(collection_id: @collection_id)
    @page_title = params[:query]+ "| "+ t(:search_results)
    regex = ".*"+params[:query].downcase+".*"    
    page_result = CollectedPage.search params[:query] do |body|
      body[:query] = {
        regexp:{
            scientific_name_string: regex
        }
     }
    end
    @page_results = page_result.results
    unless @page_results.empty?
      @page_results.each do |page_result|
        if page_result.collection_id == @collection_id.to_i
          if @result.nil?
            @result = Array.new
          end
          @result << page_result
        end
      end
    end
    #debugger
    unless (@result.nil? || @result.empty?)
      @result = @result.sort_by{|result| CollectedPage.find(result.id).scientific_name_string.downcase}
      @result = @result.paginate( page: params[:page], per_page: ENV['per_page'])
    else
      flash[:notice] = t(:no_results)+" "+ params[:query]
      redirect_to collection_path(id: @collection_id)
    end
  end

  private

  def collected_page_params
    params.require(:collected_page).permit(:id, :collection_id, :page_id, :annotation)
  end

  def existing_collected_page_params
    params.require(:collected_page).permit(:id, :collection_id, :page_id)
  end

  def new_page_params
    params.permit(:page_id, :collection_id)
  end
end

