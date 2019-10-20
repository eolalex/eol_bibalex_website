class AdvancedSearchController < ApplicationController

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
    users =Array.new
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
  
  def get_combined_ids
    @page_ids = Page.all.map(&:id)
    
    unless (params[:scientific_name].present?)
      @scientific_name_ids = @page_ids  
    else
      @scientific_name_ids = search_scientific_names(params[:scientific_name])
    end
    
    unless (params[:vernacular].present? && params[:vernacular_language].present?)
      @vernacular_ids = @page_ids
    else
      @vernacular_ids = search_vernaculars(params[:vernacular])
    end
    
    unless (params[:media].present?)
      @media_ids = @page_ids
    else
      @media_ids = search_media(params[:media])
    end
    
    unless (params[:article_title].present? && params[:article_phrase].present? && params[:article_language].present?)
      @article_ids = @page_ids
    else
      @article_ids = search_articles(params[:article_title])
    end
    combined_ids = @scientific_name_ids & @vernacular_ids & @media_ids & @article_ids
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
    @scientific_name_results.each do |res|
      scientific_name_results << res.id
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
    @vernacular_results.results.map(&:page).each do |page|
      unless (page.nil?)
        vernacular_results << page.id
      end
    end
    vernacular_results
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
    @media_results.results.map(&:page_contents).each do |content|
      unless (content.nil?)
        content.each do |c|
          media_results << c.page_id
        end
      end
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
    @article_results.results.map(&:page_contents).each do |content|
      unless (content.nil?)
        content.each do |c|
          article_results << c.page_id
        end
      end
    end
    article_results
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
        # debugger
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

