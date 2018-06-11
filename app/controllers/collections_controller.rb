class CollectionsController < ApplicationController
  before_action :authenticate_user!
  before_action :sanitize_collection_params, only: [:create]
  # before_action :find_collection_with_pages, only: [:edit, :show]
  # before_action :find_collection, only: [:update, :destroy, :add_user, :remove_user, :logs]
  # before_action :user_able_to_edit_collection, only: [:edit]
  # 
  # def new
    # @collection=Collection.new(collection_params)
  # end
  def collection_params
    params.require(:collection).permit(:name)
  end
  
  def create
  # def new
    debugger
    @collection = Collection.new(collection_params)
    # @collection.users << current_user
    if @collection.save
      flash[:notice] = I18n.t(:collection_created, name: @collection.name).html_safe
      # This looks like it could be expensive on big collections. ...but
      # remember: this is a NEW collection. It will be fast:
      # @collected = (@collection.collections + @collection.pages).first
      # if @collected
        # # log_create_activity
        # flash[:notice] = I18n.t(:collection_created_for_association,
          # name: @collection.name, associated: @collected.name,
          # link: collection_path(@collection))
        # redirect_to @collected
      # else
        # flash[:notice] = I18n.t(:collection_created, name: @collection.name).html_safe
        # redirect_to @collection
      # end
    else
      # TODO: some kind of hint as to the problem, in a flash...
      render "new"
    end
  end
  
  def sanitize_collection_params
    params[:collection][:collection_type] = Collection.collection_types[params[:collection][:collection_type]] if params[:collection]
    params[:collection][:default_sort] = Collection.default_sorts[params[:collection][:default_sort]] if params[:collection]
    # params.permit :create, keys: collection_params
  end
# def sanitize_collection_params
# collection_params = [:name, :description, :created_at, :updated_at, :collected_page_count, :collection_associations_count, :collection_type, :default_sort]
# parameter_sanitizer.permit :create, keys: collection_params
# end
end
