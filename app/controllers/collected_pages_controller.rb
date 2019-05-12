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
    @collection_id = params[:collection_id]
    @collected_pages = CollectedPage.where(collection_id: @collection_id)
    @canonical_form = params[:q]

    @pages = Page.find_by_sql("select id from pages where node_id in (select node_id from scientific_names where canonical_form like \"%#{@canonical_form}%\")")
    @pages.each do |p|
      @collected_pages.each do |collected_page|
      # debugger
        if collected_page.page.id == p.id
          if @result.nil?
            @result = Array.new
          end
        @result << p
        end
      end
    end
#debugger
    unless @result.nil?
      @result = @result.sort_by{|p| Page.find(p.id).scientific_name.downcase}
      @result = @result.paginate( page: params[:page], per_page: ENV['per_page'])
    else
      flash[:notice] = t(:no_results)+" "+ @canonical_form
      redirect_to collection_path(id: @collection_id)
    end

  #debugger
  # @collected_pages.each do |collected_page|
  # #debugger
  # # assuming scientific name has only one page
  # @scientific_names = collected_page.page.scientific_names.first
  # #@scientific_names.each do|scientific_name|
  # if @scientific_names[:canonical_form].downcase.start_with?(@canonical_form.downcase)
  # if @result.nil?
  # @result= Array.new
  # end
  # @result << @scientific_names
  # end
  # end
  # end
  # #debugger
  # unless @result.nil?
  # @result = @result.sort_by{|collected_page| collected_page.page.scientific_name.downcase}
  # @result = @result.paginate( page: params[:page], per_page: ENV['per_page'])
  # else
  # flash[:notice] = t(:no_results)+" "+ params[:q]
  # redirect_to collection_path(id: @collection_id)
  # end

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
    params.permit(:page_id, :collection_id)
  end
end

