class ArticlesController < ApplicationController
  include ApplicationHelper
  layout "application"
  def show
    @article = Article.where(id: params[:id]).first
    @license = @article.license
    @page_id = PageContent.where(content_id:params[:id] ,content_type: "Article").first.page_id
  end
end