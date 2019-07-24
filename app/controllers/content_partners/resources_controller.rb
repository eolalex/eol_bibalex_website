class ContentPartners::ResourcesController < ContentPartnersController
  before_action :authenticate_user!
  def new
    content_partner_user = User.find(ContentPartnerUser.find_by_content_partner_id(params[:content_partner_id]).user_id)
    if(content_partner_user==current_user)
       @resource = Resource.new
    else
      flash[:notice]=I18n.t(:create_resource)
      redirect_to content_partner_path(params[:content_partner_id])
    end
  end
  
  def create
      resource_params = { name: params[:resource][:name], origin_url: params[:resource][:origin_url],uploaded_url: params[:resource][:uploaded_url],
                          path: params[:resource][:path],type: params[:resource][:type],harvest_frequency: params[:resource][:harvest_frequency],
                          dataset_license: params[:resource][:dataset_license],
                          dataset_rights_holder: params[:resource][:dataset_rights_holder],dataset_rights_statement: params[:resource][:dataset_rights_statement], 
                          default_rights_holder: params[:resource][:default_rights_holder], default_rights_statement: params[:resource][:default_rights_statement],
                          default_license_string: params[:resource][:default_license_string], default_language_id: params[:resource][:default_language_id]}
      @resource = Resource.new(resource_params)
      @resource.flag =  params[:resource][:type].eql?("file")? true : false
      resource_params = { name: params[:resource][:name], originUrl: params[:resource][:origin_url],uploadedUrl: params[:resource][:uploaded_url],
                          path: params[:resource][:path],type: params[:resource][:type],harvestFrequency: params[:resource][:harvest_frequency],
                          datasetLicense: params[:resource][:dataset_license],
                          datasetRightsHolder: params[:resource][:dataset_rights_holder],datasetRightsStatement: params[:resource][:dataset_rights_statement], 
                          defaultRightsHolder: params[:resource][:default_rights_holder], defaultRightsStatement: params[:resource][:default_rights_statement],
                          defaultLicenseString: params[:resource][:default_license_string], defaultLanguageId: params[:resource][:default_language_id]}
      if @resource.valid?
        result = ResourceApi.add_resource?(resource_params, params[:content_partner_id])
        if !result.nil?
          $updated_at = DateTime.now().strftime("%Q")
          flash[:notice] = I18n.t(:successfuly_created_resource)
          redirect_to controller: 'resources', action: 'show', id: result
        else
          flash.now[:notice] =I18n.t( :error_in_connection)
          render action: 'new'
        end
      else
        render action: 'new'
      end
  end
  
  def edit
    content_partner_user = User.find(ContentPartnerUser.find_by_content_partner_id(params[:content_partner_id]).user_id)
    if(content_partner_user==current_user)
      result= ResourceApi.get_resource(params[:content_partner_id], params[:id])
      debugger
      # mappings = {"paused" => "is_paused", "approved" => "is_approved" , "trusted" => "is_trusted" , "autopublished" => "is_autopublished" , "forced" => "is_forced"}
      # result.keys.each { |k| result[ mappings[k] ] = result.delete(k) if mappings[k] }
      @resource = Resource.new(name: result["name"],origin_url: result["originalUrl"],uploaded_url: result["uploadedUrl"],
      type: result["type"],path: result["path"],last_harvested_at: result["lastHarvestedAt"],harvest_frequency: result["harvestFrequency"],
      day_of_month: result["dayOfMonth"],nodes_count: result["nodesCount"],position: result["position"],is_paused: result["paused"],
      is_approved: result["approved"],is_trusted: result["trusted"],is_autopublished: result["autopublished"],is_forced: result["forced"],
      dataset_license: result["datasetLicense"],dataset_rights_statement: result["datasetRightsStatement"],forced_internally: result["forcedInternally"],
      dataset_rights_holder: result["datasetRightsHolder"],default_license_string: result["defaultLicenseString"],
      default_rights_statement: result["defaultRightsStatement"],default_rights_holder: result["defaultRightsHolder"],
      default_language_id: result["defaultLanguageId"],is_harvest_inprogress: result["isHarvestInprogress"])
      # @resource = Resource.new(result)
    else
      flash[:notice]=I18n.t(:edit_resource)
      redirect_to content_partner_resource_path(content_partner_id: params[:content_partner_id],id: params[:id])
    end
  end
  
  def update
    result= ResourceApi.get_resource(params[:content_partner_id], params[:id])
    resource_params = { name: params[:resource][:name], origin_url: params[:resource][:origin_url],uploaded_url: params[:resource][:uploaded_url],
                        path: params[:resource][:path],type: params[:resource][:type],harvest_frequency: params[:resource][:harvest_frequency],
                        dataset_license: params[:resource][:dataset_license],
                        dataset_rights_holder: params[:resource][:dataset_rights_holder],dataset_rights_statement: params[:resource][:dataset_rights_statement], 
                        default_rights_holder: params[:resource][:default_rights_holder], default_rights_statement: params[:resource][:default_rights_statement],
                        default_license_string: params[:resource][:default_license_string], default_language_id: params[:resource][:default_language_id],
                        last_harvested_at: result["lastHarvestedAt"],default_rights_holder: result["datasetRightsStatement"],default_rights_statement:result["defaultRightsStatement"]}
    @resource = Resource.new(resource_params)
    resource_params = { name: params[:resource][:name], originUrl: params[:resource][:origin_url],uploadedUrl: params[:resource][:uploaded_url],
                        path: params[:resource][:path],type: params[:resource][:type],harvestFrequency: params[:resource][:harvest_frequency],
                        datasetLicense: params[:resource][:dataset_license],
                        datasetRightsHolder: params[:resource][:dataset_rights_holder],datasetRightsStatement: params[:resource][:dataset_rights_statement], 
                        defaultRightsHolder: params[:resource][:default_rights_holder], defaultRightsStatement: params[:resource][:default_rights_statement],
                        defaultLicenseString: params[:resource][:default_license_string], defaultLanguageId: params[:resource][:default_language_id],
                        lastHarvestedAt: result["lastHarvestedAt"],defaultRightsHolder: result["datasetRightsStatement"],defaultRightsStatement:result["defaultRightsStatement"]}
    @resource.flag = false
    if @resource.valid?
      result = ResourceApi.update_resource?(resource_params, params[:content_partner_id],params[:id])
      if !result.nil?
        flash[:notice] = I18n.t(:successfuly_updated_resource)
        redirect_to controller: 'resources', action: 'show', id: result
      else
        flash.now[:notice] = I18n.t(:error_in_connection)
        render action: 'edit'
      end
    else
      render action: 'edit'
    end
  end
  
  def show
    returned_content_partner = ContentPartnerApi.get_content_partner_without_resources(params[:content_partner_id])
    # result_partner = ContentPartnerApi.get_content_partner(params[:content_partner_id])
     
    content_partner_user = User.find(ContentPartnerUser.find_by_content_partner_id(returned_content_partner["id"].to_i).user_id)
    @content_partner = ContentPartner.new(id: returned_content_partner["id"].to_i, name: returned_content_partner["name"],
                                          logo: returned_content_partner["logo"],
                                          user: content_partner_user)
    result = ResourceApi.get_resource(params[:content_partner_id], params[:id])
    @resource = Resource.new(name: result["name"],origin_url: result["originalUrl"],uploaded_url: result["uploadedUrl"],
    type: result["type"],path: result["path"],last_harvested_at: result["lastHarvestedAt"],harvest_frequency: result["harvestFrequency"],
    day_of_month: result["dayOfMonth"],nodes_count: result["nodesCount"],position: result["position"],is_paused: result["paused"],
    is_approved: result["approved"],is_trusted: result["trusted"],is_autopublished: result["autopublished"],is_forced: result["forced"],
    dataset_license: result["datasetLicense"],dataset_rights_statement: result["datasetRightsStatement"],
    dataset_rights_holder: result["datasetRightsHolder"],default_license_string: result["defaultLicenseString"],
    default_rights_statement: result["defaultRightsStatement"],default_rights_holder: result["defaultRightsHolder"],
    default_language_id: result["defaultLanguageId"])
    # mappings = {"_paused" => "is_paused", "_approved" => "is_approved" , "_trusted" => "is_trusted" , "_autopublished" => "is_autopublished" , "_forced" => "is_forced", "forced_internally"=> "forced_internally"}
    # result.keys.each { |k| result[ mappings[k] ] = result.delete(k) if mappings[k] }
    #@resource = Resource.new(result)
  end
  
end
