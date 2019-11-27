class ArticlesController < ApplicationController
  layout "application"
  include ApplicationHelper

  def show
    @article = Article.where(id: params[:id]).first
    @license = @article.license
    @page_id = PageContent.where(content_id:params[:id], content_type: "Article").first.page_id
  end
end