class Page < ActiveRecord::Base

  has_many :collected_pages
  searchkick word_start: [:scientific_name]
  belongs_to :node
  has_many :scientific_names
  has_many :page_contents, class_name: 'PageContent', primary_key: 'id', foreign_key: 'page'
  has_many :media, through: :page_contents, source: :content, source_type: "Medium"
  has_many :articles, through: :page_contents, source: :content, source_type: "Article"
  has_and_belongs_to_many :referents  
  has_many :vernaculars,  class_name: "Vernacular", foreign_key: 'page_id'
  has_many :pages_node
  has_many :nodes, through: :pages_node
  
  def search_data
      {
        id: id,
        scientific_name: scientific_name
      }
  end
#   
   def scientific_name
    node.try(:scientific_name) || "No Name!"
   end
#   
  def synonyms
    scientific_names.synonym.map { |n| n.canonical_form }
  end
  
  def maps
    media.where(subclass: Medium.subclasses[:map])
  end


 # TRAITS METHODS


  def data(page = 1, per = 2000)
    return @data[0..per] if @data
    data = TraitBank.by_page(id, page, per)
    # Self-healing count of number of data:
    @data_toc_needs_other = false
    @data_toc = data.flat_map do |t|
      next if t[:predicate][:section_ids].nil? # Usu. test data...
      secs = t[:predicate][:section_ids].split(",")
      @data_toc_needs_other = true if secs.empty?
      secs.map(&:to_i)
    end.uniq
    @data_toc = Section.where(id: @data_toc) unless @data_toc.empty?
    @data_loaded = true
    @data = data
  end



  def glossary
    @glossary ||= TraitBank::Terms.page_glossary(id)
  end

  def grouped_data
    @grouped_data ||= data.group_by { |t| t[:predicate][:uri] }
  end

  def predicates
    @predicates ||= grouped_data.keys.sort
  end

  def object_terms
    @object_terms ||= glossary.keys - predicates
  end

 
  end