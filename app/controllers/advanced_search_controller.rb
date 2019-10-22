class AdvancedSearchController < ApplicationController
  before_action :get_predicates, only: [:pages, :collections]
  $neo = Neography::Rest.new
  
  def pages
  end
  
  def collections
  end
  
  def pages_results
    combined_ids = get_combined_ids
    @results = Page.where(id: combined_ids)
    if (@results.empty?)
      flash[:notice] = "#{t(:no_match_advanced)}"
      redirect_back(fallback_location: root_path)
    else
      @results = @results.paginate( page: params[:page], per_page: ENV['per_page'])
    end
  end
  
  def collections_results
    collections = Array.new
    users = Array.new
    @results = Array.new

    if (params[:collection_name].present?)
      collections = search_collections(params[:collection_name]).results
    end

    if (params[:collection_user].present?)
      users = search_users(params[:collection_user]).results
    end

    if (params[:collection_name].present? && params[:collection_user].present?)
      unless (collections.empty? && users.empty?)
        @collection_results = get_collection_results(collections, users)
      end
    elsif(params[:collection_name].present?)
      @collection_results = collections
    else
      @collection_results = get_all_user_collections(users)
    end

    unless (@collection_results.empty?)
      combined_page_ids = get_combined_ids
      unless (combined_page_ids.empty?)
        @results = search_collections_for_pages(@collection_results, combined_page_ids)
      end
    end

    if (@results.empty?)
      flash[:notice] = "#{t(:no_match_advanced)}"
      redirect_back(fallback_location: root_path)
    else
      @results = @results.paginate( page: params[:page], per_page: ENV['per_page'])
    end
    
  end
  
  def get_predicates
    $predicates = Array.new
    @predicates = []
    results = $neo.execute_query("MATCH ((t:Trait)-[:predicate]->(n:Term))  RETURN DISTINCT n.name")
    @predicates = results["data"].map {|row| Hash[*results["columns"].zip(row).flatten]["n.name"] }
    $predicates = @predicates.empty? ? ["No traits to show"] : @predicates
  end
  
  def get_combined_ids
    @scientific_name_ids = Array.new
    @vernacular_ids = Array.new
    @media_ids = Array.new
    @article_ids = Array.new
    @traits_ids = Array.new
    combined_ids = Array.new
            
    if (params[:scientific_name].present?)
      @scientific_name_ids = search_scientific_names(params[:scientific_name])
    end
    
    if (params[:vernacular].present?)
      @vernacular_ids = search_vernaculars(params[:vernacular])
    end
    
    if (params[:media].present?)
      @media_ids = search_media(params[:media])
    end
    
    if (params[:article_title].present?)
      @article_ids = search_articles(params[:article_title])
    end
    
    if (params[:predicate_to].present? and params[:predicate_from.present])
      @traits_ids = search_traits(params[:predicate], params[:predicate_from].to_i, params[:predicate_to].to_i)
    end
    
    if (@scientific_name_ids.empty? && @vernacular_ids.empty? && @media_ids.empty? && @article_ids.empty? && @traits_ids.empty?)
      combined_ids = []
    else
      combined_ids = get_array_intersection(@scientific_name_ids, @vernacular_ids, @media_ids, @article_ids, @traits_ids)
    end
    combined_ids
  end 
  
  def search_scientific_names(query)
    scientific_name_results = Array.new
    scientific_name_regex = ".*" + query.downcase + ".*"
    @scientific_name_results = Page.search params[:scientific_name] do |body|
      body[:query] = {
        regexp: {
          scientific_name: scientific_name_regex
        }
      }
    end
    unless(@scientific_name_results.empty?)
      @scientific_name_results.each do |res|
        scientific_name_results << res.id
      end
    else
      scientific_name_results = ["empty"]
    end
    scientific_name_results
  end
  
  def search_vernaculars(query)
    vernacular_results = Array.new
    vernacular_regex = ".*" + query.downcase + ".*"
    @vernacular_results = Vernacular.search query do |body|
      body[:query] = {
        regexp: {
          name_string: vernacular_regex
        }
      }
    end
    vernacular_results = @vernacular_results.results.empty? ? ["empty"] : @vernacular_results.results.map(&:page_id)
  end
  
  def search_media(query)
    media_results = Array.new
    media_regex = ".*" + query.downcase + ".*"
    @media_results = Medium.search query do |body|
      body[:query] = {
        regexp: {
          file_name: media_regex
        }
      }
    end
    unless(@media_results.results.empty?)
      @media_results.results.map(&:page_contents).each do |content|
        unless (content.nil?)
          content.each do |c|
            media_results << c.page_id
          end
        end
      end
    else
      media_results = ["empty"]
    end
    media_results
  end
  
  def search_articles(query)
    article_results = Array.new
    article_regex = ".*" + query.downcase + ".*"
    @article_results = Article.search query do |body|
      body[:query] = {
        regexp: {
          title: article_regex
        }
      }
    end
    unless(@article_results.empty?)
      @article_results.results.map(&:page_contents).each do |content|
        unless (content.nil?)
          content.each do |c|
            article_results << c.page_id
          end
        end
      end
    else
      article_results = ["empty"]   
    end
    article_results
  end
  
  def search_traits(term, lower_boundary, upper_boundary)
    traits_ids = Array.new
    traits = $neo.execute_query("MATCH (:Term {name: \"#{term}\"})<-[:predicate]-(t:Trait)<-[:trait]-(p:Page) where #{lower_boundary} <= t.measurement <= #{upper_boundary} RETURN DISTINCT p.page_id")
    ids = traits["data"].map {|row| Hash[*traits["columns"].zip(row).flatten]["p.page_id"] }
    traits_ids = ids.empty? ? ["empty"] : ids
  end
  
  def get_array_intersection(scientific_names, vernaculars, media, articles, traits)
    
    combined_ids = Page.all.ids

    if ((scientific_names.first != "empty") && (params[:scientific_name].present?))
      combined_ids &= scientific_names
    end
    if ((vernaculars.first != "empty") && (params[:vernacular].present?))
      combined_ids &= vernaculars
    end
    if ((media.first != "empty") && (params[:medium].present?))
      combined_ids &= media
    end
    if ((articles.first != "empty") && (params[:article].present?))
      combined_ids &= articles
    end
    if ((traits.first != "empty") && (params[:predicate_to].present?) && (params[:predicate_from].present?))
      combined_ids &= traits
    end

    combined_ids
  end
  
  def search_collections(query)
    collection_regex = ".*" + query.downcase + ".*"
    collections = Collection.search query do |body|
      body[:query] = {
        regexp: {
          name: collection_regex
        }
      }
    end
  end
  
  def search_users(query)
    user_regex = ".*" + query.downcase + ".*"
    users = User.search query do |body|
      body[:query] = {
        regexp: {
          username: user_regex
        }
      }
    end
  end

  def get_collection_results(collections, users)
    collection_results = Array.new
    users.each do |user|
      collections.each do |collection|
        if collection.users.map(&:id).include? user.id
          collection_results << collection
        end
      end
    end
    collection_results
  end
  
  def get_all_user_collections(users)
    collection_results = Array.new
    users.each do |user|
      @collections = user.collections
      unless @collections.empty?
        @collections.each do |collection|
          collection_results << collection
        end
      end
    end
    collection_results
  end
  
  def search_collections_for_pages(collection_results, combined_page_ids)
    collections = Array.new
    collection_results.each do |collection|
      combined_page_ids.each do |id|
        if (collection.collected_pages.map(&:page_id).include? id)
          collections << collection
        end
      end
    end
    collections
  end
  
end

