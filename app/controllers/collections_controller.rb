class CollectionsController < ApplicationController

  before_action :authenticate_user!


  def new
    @collection = Collection.new
  end

  def create
    @collection = Collection.new(collection_params)
    @collection.users << current_user
    if @collection.save
      flash[:notice] = "Collection Created"
      render 'new'
    else
      render "new"
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
    @pages = @collection.collected_pages
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
    params.require(:collection).permit(:name, :description, :collection_type, :default_sort,
      collected_pages_attributes: [:id, :page_id, :annotation,
        collected_pages_media_attributes: [:medium_id, :collected_page_id, :_destroy]])
  end

end
