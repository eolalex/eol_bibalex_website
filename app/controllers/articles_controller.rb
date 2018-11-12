class ArticlesController < ApplicationController
  include ApplicationHelper
  layout "application"
  def show
    @article = Article.where(id: params[:id]).first
    @license = @article.license
  end
end