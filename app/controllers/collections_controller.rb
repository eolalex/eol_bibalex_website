class CollectionsController < ApplicationController

  before_action :authenticate_user!


  def new
    @collection = Collection.new
    respond_to do |format|
      format.html {}
      format.js {}
    end
  end

  def create
    @collection = Collection.new(collection_params)
    if @collection.save
      @collection.users << current_user
      flash[:notice] = "Collection Created"
      redirect_to @collection
      respond_to do |format|
        format.html {}
        format.js {}
      end
    else
      redirect_to root_path
    end
  end

  def edit
    @collection = Collection.find(params[:id])
  end
  
  def update
    @collection = Collection.find(params[:id])
    if @collection.update_attributes (collection_params)
     flash[:success] = "Successfully Updated"
     redirect_to @collection
    else
      render 'edit'
    end
  end
  
  def show
    @collection = Collection.find(params[:id])
    @collected_pages = @collection.collected_pages
    @collected_pages = @collected_pages.sort_by{|collected_page| collected_page.page.scientific_name.downcase} 
    @collected_pages = @collected_pages.paginate(:page => params[:page], :per_page => ENV['per_page'])
  end

  def destroy
    @collection = Collection.find(params[:id])
    @user = current_user
    if @collection.destroy
      flash[:notice] = "Collection Deleted"
      redirect_to root_path
    end
  end

  def collection_params
    params.require(:collection).permit(:id, :name, :description, :collection_type, :default_sort,
      collected_pages_attributes: [:id, :page_id, :annotation,
        collected_pages_media_attributes: [:medium_id, :collected_page_id, :_destroy]])
  end

end
