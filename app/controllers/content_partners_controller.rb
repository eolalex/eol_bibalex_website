class ContentPartnersController < ApplicationController
  include ApplicationHelper
  before_action :authenticate_user!
  require 'uri'
  def new
    @content_partner = ContentPartner.new
  end

  def create
#logoType attribute need to be used
    logo = params[:content_partner][:logo].nil? ? nil : params[:content_partner][:logo]
    content_partner_params = { name: params[:content_partner][:name], description: params[:content_partner][:description],
                               abbreviation: params[:content_partner][:abbreviation], url: params[:content_partner][:url], logo: params[:content_partner][:logo] }
    @content_partner = ContentPartner.new(content_partner_params)
    if @content_partner.valid?
      result = ContentPartnerApi.add_content_partner?(content_partner_params, current_user.id)
      # result = ContentPartnerApi.add_content_partner?(content_partner_params, nil)
      
      if !result.nil?
        $updated_at = DateTime.now().strftime("%Q")
        add_content_partner_to_repository(content_partner_params[:name], result.to_i)
        flash[:notice] = I18n.t(:successfuly_created_content_partner)
        redirect_to controller: 'content_partners', action: 'show', id: result
      else
        flash.now[:notice] = I18n.t(:error_in_connection)
        render action: 'new'
      end
    else
      render action: 'new'
    end
  end
  
  def edit
    content_partner_user = User.find(ContentPartnerUser.find_by_content_partner_id(params[:id]).user_id)
    if(content_partner_user==current_user)
      returned_content_partner  = ContentPartnerApi.get_content_partner_without_resources(params[:id])
      @content_partner = ContentPartner.new(name: returned_content_partner["name"], abbreviation: returned_content_partner["abbreviation"],
                                            url: returned_content_partner["url"], description: returned_content_partner["description"],
                                            logo: returned_content_partner["logoPath"])
     logo_path = @content_partner.logo
     logo_path_array = logo_path.split("/")
     @logo_name = logo_path_array.last
    else
      flash[:notice]=I18n.t(:edit_content_partner)
      redirect_to content_partner_path(params[:id])
    end
  end
  
  def update
    logo = params[:content_partner][:logo].nil? ? nil : params[:content_partner][:logo]
    content_partner_params = { name: params[:content_partner][:name], description: params[:content_partner][:description],
                               abbreviation: params[:content_partner][:abbreviation], url: params[:content_partner][:url], logo: logo }
    @content_partner = ContentPartner.new(content_partner_params)
    if @content_partner.valid?
      result = ContentPartnerApi.update_content_partner?(params[:id], content_partner_params)
      if result
        update_content_partner_in_repository(content_partner_params[:name], result.to_i)
        flash[:notice] = I18n.t(:Successfully_updated_content_partner)
        redirect_to controller: 'content_partners', action: 'show', id: result
      else
        flash[:notice] = I18n.t(:error_in_connection)
        render action: 'edit'
      end
    else
      render action: 'edit'
    end
  end
  
  def show
      result = ContentPartnerApi.get_content_partner_with_resources(params[:id])
      returned_content_partner = result
      resources = []
      returned_content_partner["resources"].each do |resource|
        resources << Resource.new(id: resource["id"].to_i, name: resource["name"], origin_url: resource["origin_url"], type: resource["type"], path: resource["path"], 
                                  last_harvested_at: resource["last_harvested_at"], harvest_frequency: resource["harvest_frequency"], 
                                  day_of_month: resource["day_of_month"], nodes_count: resource["nodes_count"], position: resource["position"],
                                  is_paused: resource["is_paused"], is_approved: resource["is_approved"], is_trusted: resource["is_trusted"],
                                  is_autopublished: resource["is_autopublished"], is_forced: resource["is_forced"], dataset_license: resource["dataset_license"],
                                  dataset_rights_statement: resource["dataset_rights_statement"], dataset_rights_holder: resource["dataset_rights_holder"],
                                  default_license_string: resource["default_license_string"], default_rights_statement: resource["default_rights_statement"],
                                  default_rights_holder: resource["default_rights_holder"], default_language_id: resource["default_language_id"],
                                  harvests: resource["harvests"])
      end

      #TODO check if user of the content partner is the manager or not
      content_partner_user = User.find(ContentPartnerUser.find_by_content_partner_id(returned_content_partner["id"].to_i).user_id)
      # content_partner_user = nil
      @content_partner = ContentPartner.new(id: returned_content_partner["id"].to_i, name: returned_content_partner["name"],
                                            abbreviation: returned_content_partner["abbreviation"],url: returned_content_partner["url"],
                                            description: returned_content_partner["description"],logo: returned_content_partner["logoPath"],
                                            created_at: returned_content_partner["returned_content_partner"], resources: resources, user: content_partner_user)
  end

  def index
    content_partners = $content_partner_repository.search(query: {match_all: {}}, size: ENV["ES_RESULT_SIZE"]).results
    @content_partners = content_partners.paginate(page: params[:page], per_page: ENV["per_page"])
  end

  def add_content_partner_to_repository(name, id)
    @content_partner_result = {"name": name.downcase, "id": id}
    $content_partner_repository.save(@content_partner_result)
  end

  def update_content_partner_in_repository(name, id)
    @update_result = {"name": name.downcase, "id": id}
    $content_partner_repository.update(@update_result)
  end
  
end