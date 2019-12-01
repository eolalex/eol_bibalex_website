class PagesController < ApplicationController
  include ApplicationHelper
  include PagesHelper
  before_action :authenticate_user!, only: [:index, :new]

  def index
  end

  def new
  end

  def show
    @page = Page.find(params[:id])
    @page_title = @page.scientific_name
    respond_to do |format|
      format.html{}
    end
  end

  def collect
  end

  def autocomplete
    render json: Page.search(params[:query], {
      fields: ["scientific_name^5"],
      match: :word_start,
      load: false,
      misspellings: false
    })
  end

  def media
    @page = Page.where(id: params[:page_id]).first
    @page_title = @page.scientific_name
  end

  def media_grid
    @page = Page.where(id: params[:page_id]).first
    if params[:maps] == "true"
      maps
    else
      options = Hash.new
      options[:index] = "page_contents_medium"
      options[:type] = "_doc"
      options[:size] = 1000
      options[:body] = {query: {match: {'page_id': params[:page_id]}}}
      page_contents_json = PageContent.__elasticsearch__.client.search(options)["hits"]["hits"].
        to_a.map{|result| result["_source"]}.to_json
      @page_contents = JSON.parse(page_contents_json, object_class:PageContent).paginate(page: params[:page], per_page: ENV['PER_PAGE'])
    end

    render partial: "media_grid"
  end

  def articles
    @page = Page.where(id: params[:page_id]).first
    @page_title = @page.scientific_name
  end

  def articles_tab
    @page = Page.where(id: params[:page_id]).first
    @articles = @page.articles
    @articles = @articles.paginate(page: params[:page], per_page: ENV['PER_PAGE'])
    render partial: "articles"
  end

  def maps
    @page = Page.where(id: params[:page_id]).first
    @page_title = @page.scientific_name
    @maps = @page.maps
    @media = @maps
    @media = @media.paginate(page: params[:page], per_page: ENV['PER_PAGE'])
  end

  def literature_and_references
    @page = Page.where(id: params[:page_id]).first
  end

  def literature_and_references_tab
    @page = Page.where(id: params[:page_id]).first
    @page_title = @page.scientific_name
    render partial: "literature_and_references"
  end

  def self.get_reference_content_partner(reference)
    content_partner_id = ContentPartnerApi.get_content_partner_resource_id(reference.parent.resource_id)
    content_partner_id
  end

  def self.get_reference_resource(result)
    @resource = Resource.new(
      name: result["name"],
      origin_url: result["original_url"],
      uploaded_url: result["uploaded_url"],
      type: result["type"],
      path: result["path"],
      last_harvested_at: result["last_harvested_at"],
      harvest_frequency: result["harvest_frequency"],
      day_of_month: result["day_of_month"],
      nodes_count: result["nodes_count"],
      position: result["position"],
      is_paused: result["_paused"],
      is_approved: result["_approved"],
      is_trusted: result["_trusted"],
      is_autopublished: result["_autopublished"],
      is_forced: result["_forced"],
      dataset_license: result["dataset_license"],
      dataset_rights_statement: result["dataset_rights_statement"],
      dataset_rights_holder: result["dataset_rights_holder"],
      default_license_string: result["default_license_string"],
      default_rights_statement: result["default_rights_statement"],
      default_rights_holder: result["default_rights_holder"],
      default_language_id: result["default_language_id"]
    )
    resource
  end

  def names
    @page = Page.where(id: params[:id]).first
    @page_title = @page.scientific_name
    respond_to do |format|
      format.html {}
    end
  end

  def vernaculars_tab
    @page = Page.where(id: params[:page_id]).first
    @vernaculars = @page.vernaculars
    render partial: "vernaculars"
  end

  def classification_tab
    @page = Page.where(id: params[:page_id]).first
    render partial: "classification"
  end

  def scientific_names_tab
    @page = Page.where(id: params[:page_id]).first
    @scientific_names = @page.scientific_names
    render partial: "scientific_names"
  end

  def data
    @page = Page.where(id: params[:page_id]).first
    @page_title = @page.scientific_name
  end

  def data_grid
    traits =[]
    @page = Page.where(id: params[:page_id]).first
    @resources = TraitBank.resources(@page.data)
    @resources_content_partners = get_content_partner_of_resources()
    predicates = @page.predicates
    # display predicates with same uri in sequence
    predicates.each_with_index do |uri, index|
      # returns resource, trait, predicate, object_term, units, sex_term, lifestage_term,
      # statistical_method_term of page of predicate in form of predicate[:uri]
      @page.grouped_data[uri].each do |trait|
        traits << trait
      end
    end
    
    @traits = traits.paginate(page: params[:page], per_page: ENV['PER_PAGE'])
    return render(status: :not_found) unless @page
    respond_to do |format|
      format.html {}
      format.js {}
    end
    render partial: "data_grid"
  end
end
