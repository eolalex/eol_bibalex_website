class ArticlesController < ApplicationController
  layout "application"
  include ApplicationHelper

  def show
    @article = Article.where(id: params[:id]).first
    @license = @article.license
    @page_id = PageContent.where(content_id: params[:id], content_type: "Article").first.page_id
    @content_partner_id = ContentPartnerApi.get_content_partner_resource_id(@article.resource_id)
    @result = ResourceApi.get_resource(@content_partner_id["id"], @article.resource_id)
    @resource = Resource.new(
      name: @result["name"],
      origin_url: @result["original_url"],
      uploaded_url: @result["uploaded_url"],
      type: @result["type"],
      path: @result["path"],
      last_harvested_at: @result["last_harvested_at"],
      harvest_frequency: @result["harvest_frequency"],
      day_of_month: @result["day_of_month"],
      nodes_count: @result["nodes_count"],
      position: @result["position"],
      is_paused: @result["_paused"],
      is_approved: @result["_approved"],
      is_trusted: @result["_trusted"],
      is_autopublished: @result["_autopublished"],
      is_forced: @result["_forced"],
      dataset_license: @result["dataset_license"],
      dataset_rights_statement: @result["dataset_rights_statement"],
      dataset_rights_holder: @result["dataset_rights_holder"],
      default_license_string: @result["default_license_string"],
      default_rights_statement: @result["default_rights_statement"],
      default_rights_holder: @result["default_rights_holder"],
      default_language_id: @result["default_language_id"]
    )

    attributions = @article.attributions.sort_by{|hsh| hsh[:role_name]}
    @attributions = attributions.group_by {|t| t[:role_name]}
  end
end
