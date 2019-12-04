class CollectedPagesController < ApplicationController
  layout "application"
  include ApplicationHelper
  before_action :authenticate_user!

  def show
    @collected_page = CollectedPage.find(params[:id])
    respond_to do |format|
      format.html {}
    end
  end

  def new
    @collected_page = CollectedPage.new
    respond_to do |format|
      format.html {}
    end
  end

  def create
    @collected_page = CollectedPage.find_or_initialize_by(existing_collected_page_params)
    is_new_page = @collected_page.new_record?
    if @collected_page.save
      if is_new_page
        respond_to do |format|
          format.html {}
          format.js {}
        end
        flash[:notice] = "#{@collected_page.scientific_name_string }: #{t(:page_added_to_collection)}: #{@collected_page.collection.name}"
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
        $updated_at = DateTime.now().strftime("%Q")
        Collection.destroy(@collection.id)
        redirect_to user_path(current_user)
      else
        redirect_to @collection
      end
      flash[:notice] = t(:page_deleted)
    end
  end

  def index
    @collection_id = params[:collection_id]
    @collected_pages = CollectedPage.where(collection_id: @collection_id)
    @page_title = "#{params[:cp_query]}| #{t(:search_results)}"
    regex = ".*#{params[:cp_query].downcase}.*"

    page_results = CollectedPage.search params[:cp_query] do |body|
      body[:query] = {
        regexp:{
          scientific_name_string: regex
        }
     }
    end

    @page_results = page_results.results
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

    if @result.present?
      @result = @result.sort_by{|result| CollectedPage.find(result.id).scientific_name_string.downcase}
      @result = @result.paginate(page: params[:page], per_page: ENV['PER_PAGE'])
    else
      flash[:notice] = t(:no_results) + " " + params[:cp_query]
      redirect_to collection_path(id: @collection_id)
    end
  end

  def autocomplete
    render json: CollectedPage.search(params[:cp_query],
      {
        fields: ["scientific_name_string^5"],
        where: {collection_id: params[:collection_id].to_i},
        match: :word_start,
        load: false,
        misspellings: false
      })
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

