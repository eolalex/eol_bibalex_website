require 'uri'
require 'json'
require 'pathname'
require "date"
require "enumerator"
require "fileutils"
require "yaml"
require 'geo/coord'
# require 'environment.rb'
$sql_commands= File.new('commands.sql', 'w')
$occurrence_maps_count = 0
$occurrence_maps_array = Array.new()
$node_ancestors_array = Array.new()
$terms=""
$meta=""
$traits=""
$terms_array = Array.new()
$traits_array = Array.new()
$meta_array = Array.new()

def load_occurrence(occurrences, page_id, resource_id)
  unless occurrences.nil?
     occurrences.each do |occurrence|
       
       if occurrence["deltaStatus"] == "I"
         OccurrencePageMapping.create(resource_id: resource_id, occurrence_id: occurrence["occurrenceId"], page_id: page_id)
         
       else               
         res = OccurrencePageMapping.where(resource_id: resource_id, occurrence_id: occurrence["occurrenceId"])
         unless res.nil?
           old_occurrence_mapping = res.first
           unless old_occurrence_mapping.nil?
             if occurrence["deltaStatus"] == "U"
               old_occurrence_mapping.update_attributes(page_id: page_id)
             else
               old_occurrence_mapping.destroy
             end
           end
         end               
       end
     end
   end
end

def check_for_upadtes
  scheduler_uri = "#{SCHEDULER_ADDRESS}/#{CHECK_FOR_UPDATES}"
  last_harvested_time = "1536650663000"
  begin
    request =RestClient::Request.new(
      :method => :get,
      :timeout => -1,
      :url => "#{scheduler_uri}/#{last_harvested_time}"
    )
    response = request.execute
    response.body
  rescue => e
    false
  end
end

def get_latest_updates_from_hbase(last_harvested_time, start_key)
  hbase_uri = "#{HBASE_ADDRESS}#{HBASE_GET_LATEST_UPDATES_ACTION}"
 start_harvested_time = "1510150973451"
  
  # last_harvested_time = "#{DateTime.now.strftime('%Q')}"
  begin
    request =RestClient::Request.new(
      :method => :get,
      :timeout => -1,
      :url => "#{hbase_uri}/#{start_harvested_time}/#{last_harvested_time}/#{start_key}"
    )
    response = request.execute
    response.body
  rescue => e
    debugger
    c="l"
    false
  end
end

 def get_latest_updates_from_mysql(start_harvested_time , end_harvested_time)
  mysql_uri = "#{MYSQL_ADDRESS}#{MYSQL_GET_LATEST_UPDATES_ACTION}"
  begin
    request = RestClient::Request.new(
      :method => :get,
      :timeout => -1,
      :url => "#{mysql_uri}/#{start_harvested_time}/#{end_harvested_time}"
    )
    response = request.execute
    response.body
  rescue => e
    debugger
    c="l"
    false
  end
end

def get_end_time
  mysql_uri = "#{MYSQL_ADDRESS}#{MYSQL_GET_END_TIME}"
  begin
    request = RestClient::Request.new(
      :method => :get,
      :timeout => -1,
      :url => "#{mysql_uri}"
    )
    response = request.execute
    response.body
  rescue => e
    debugger
    c="l"
    false
  end
end

def create_measurement(occurrence_of_measurement , measurement)
  options = {}
  # $terms.write("predicate_name_#{measurement["measurementId"]}\t#{measurement["measurementType"]}\t1,2,3\tpredicate definition\n")
  $terms_array << "predicate_name_#{measurement["measurementId"]}\t#{measurement["measurementType"]}\t1,2,3\tpredicate definition"
  options[:predicate_uri]=measurement["measurementType"]

  if uri?(measurement["measurementValue"])
    # $terms.write("temp object term_#{measurement["measurementId"]}\t#{measurement["measurementValue"]}\t1,2,3\tobject_term definition\n")
    $terms_array << "temp object term_#{measurement["measurementId"]}\t#{measurement["measurementValue"]}\t1,2,3\tobject_term definition"
    options[:object_term_uri]= measurement["measurementValue"]
  else
  #TODO update this part after discussing it with stakeholders
    options[:literal] = measurement["measurementValue"]
  end

  if measurement["unit"]
    # $terms.write("unit_#{measurement["measurementId"]}\t#{measurement["unit"]}\t1,2,3\ttest units\n")
    $terms_array << "unit_#{measurement["measurementId"]}\t#{measurement["unit"]}\t1,2,3\ttest units"
    options[:units_term_uri]=measurement["unit"]
  end

  convert_measurement(options,measurement["unit"])

  unless measurement["citation"].nil?
    options[:citation] = measurement["citation"].gsub('"','\"')
  end

  unless measurement["source"].nil?
    options[:source] = measurement["source"].gsub('"','\"')
  end

  unless measurement["measurementMethod"].nil?
    options[:measurementMethod] = measurement["measurementMethod"].gsub('"','\"')
  end
  options
end

def add_neo4j(node_params, occurrences, measurements, associations,target_occurrences,terms)
  
  unless (occurrences.nil? || occurrences.empty?)
    # load occurrences
    occurrences_hash = {}    
    occurrences.each do |occurrence|
      occurrences_hash[occurrence["occurrenceId"]] = occurrence
  end
    
  unless (associations.nil? || associations.empty?)
    object_page_id=""
    associations.each do |association|
      # res = OccurrencePageMapping.where(resource_id: node_params[:resource_id], occurrence_id: association["targetOccurrenceId"])
      # unless res.empty?
        # occurrence_mapping = res.first
        # object_page_id = occurrence_mapping.page_id
      # end
object_page_id = target_occurrences[association["targetOccurrenceId"]]
      # $terms.write("predicate_name_#{association["associationId"]}\t#{association["associationType"]}\t1,2,3\tpredicate definition\n")
      $terms_array << "predicate_name_#{association["associationId"]}\t#{association["associationType"]}\t1,2,3\tpredicate definition"
      occurrence_of_association = occurrences_hash[association["occurrenceId"]]
      if occurrence_of_association && occurrence_of_association["sex"]
       # $terms.write("sex_#{association["associationId"]}\t#{occurrence_of_association["sex"]}\t1,2,3\tsex term object_term definition\n")
       $terms_array << "sex_#{association["associationId"]}\t#{occurrence_of_association["sex"]}\t1,2,3\tsex term object_term definition"
       sex_uri = occurrence_of_association["sex"]
      end
      
      if occurrence_of_association && occurrence_of_association["lifeStage"]
        # $terms.write("lifeStage_#{association["associationId"]}\t#{occurrence_of_association["lifeStage"]}\t1,2,3\tlifeStage term object_term definition\n")
        $terms_array << "lifeStage_#{association["associationId"]}\t#{occurrence_of_association["lifeStage"]}\t1,2,3\tlifeStage term object_term definition"
        life_uri = occurrence_of_association["lifeStage"]
      end
       
      unless association["citation"].nil?
        citation = association["citation"].gsub('"','\"')
      end
      unless association["source"].nil?
        source = association["source"].gsub('"','\"')
      end
      unless association["measurementMethod"].nil?
        measurementMethod = association["measurementMethod"].gsub('"','\"')
      end
        # $traits.write("#{association["associationId"]}\t#{association["occurrenceId"]}\tA_#{association["occurrenceId"]}_#{association["associationId"]}\t#{node_params[:scientific_name]}\t#{citation}\t#{source}\t#{measurementMethod}\t\t\t\t\t#{node_params[:page_id].to_i}\t#{node_params[:resource_id].to_i}\t#{association["associationType"]}\t\t\t#{life_uri}\t#{sex_uri}\t\t#{object_page_id}\n")
        $traits_array << "#{association["associationId"]}\t#{association["occurrenceId"]}\tA_#{association["occurrenceId"]}_#{association["associationId"]}\t#{node_params[:scientific_name]}\t#{citation}\t#{source}\t#{measurementMethod}\t\t\t\t\t#{node_params[:page_id].to_i}\t#{node_params[:resource_id].to_i}\t#{association["associationType"]}\t\t\t#{life_uri}\t#{sex_uri}\t\t#{object_page_id}"
      end
    end
    
    unless (measurements.nil? || measurements.empty?)
      measurements_array = []
      measurements.each do |measurement|
        occurrence_of_measurement = occurrences_hash[measurement["occurrenceId"]]
        
        if (!measurement["measurementOfTaxon"].nil?) && (VALID_ARRAY.include?((measurement["measurementOfTaxon"]).downcase))  
          object_page_id=""  
          options = create_measurement(occurrence_of_measurement , measurement)
          
          unless options[:measurementMethod].nil?
            measurementMethod = options[:measurementMethod]
          end
          unless options[:object_term_uri].nil?
            object_term_uri = options[:object_term_uri]
          end
          unless options[:units_term_uri].nil?
            unit_term_uri = options[:units_term_uri]
          end
          unless options[:citation].nil?
            citation = options[:citation]
            
          end
          unless options[:source].nil?
            source = options[:source]
          end
          unless options[:literal].nil?
            literal = options[:literal]
          end
          unless options[:measurement].nil?
            o_measurement = options[:measurement]
          end
          unless options[:normal_measurement].nil?
            normal_measurement = options[:normal_measurement]
          end
          unless options[:normal_units].nil?
            normal_units = options[:normal_units]
          end
          
          if occurrence_of_measurement && occurrence_of_measurement["lifeStage"]
            # $terms.write("lifeStage_#{measurement["measurementId"]}\t#{occurrence_of_measurement["lifeStage"]}\t1,1,2,3\tlifeStage term object_term definition\n")
            $terms_array << "lifeStage_#{measurement["measurementId"]}\t#{occurrence_of_measurement["lifeStage"]}\t1,1,2,3\tlifeStage term object_term definition"
            life_uri = occurrence_of_measurement["lifeStage"]
          end
          if occurrence_of_measurement && occurrence_of_measurement["sex"]
            # $terms.write("sex_#{measurement["measurementId"]}\t#{occurrence_of_measurement["sex"]}\t1,2,3\tsex term object_term definition\n")
            $terms_array << "sex_#{measurement["measurementId"]}\t#{occurrence_of_measurement["sex"]}\t1,2,3\tsex term object_term definition"
            sex_uri = occurrence_of_measurement["sex"]
          end
          unless measurement["statisticalMethod"].nil?
            #$terms.write("statisticalMethod_#{measurement["measurementId"]}\t#{measurement["statisticalMethod"]}\t1,2,3\tstatisticalMethod term object_term definition\n")
            $terms_array << "statisticalMethod_#{measurement["measurementId"]}\t#{measurement["statisticalMethod"]}\t1,2,3\tstatisticalMethod term object_term definition"
            statisticalMethod_uri = measurement["statisticalMethod"]
          end
          # $traits.write("#{measurement["measurementId"]}\t#{measurement["occurrenceId"]}\tM_#{measurement["occurrenceId"]}_#{measurement["measurementId"]}\t#{node_params[:scientific_name]}\t#{citation}\t#{source}\t#{measurementMethod}\t#{literal}\t#{normal_measurement}\t#{normal_units}\t#{o_measurement}\t#{node_params[:page_id].to_i}\t#{node_params[:resource_id].to_i}\t#{measurement["measurementType"]}\t#{object_term_uri}\t#{unit_term_uri}\t#{life_uri}\t#{sex_uri}\t#{statisticalMethod_uri}\t#{object_page_id}\n")
          $traits_array << "#{measurement["measurementId"]}\t#{measurement["occurrenceId"]}\tM_#{measurement["occurrenceId"]}_#{measurement["measurementId"]}\t#{node_params[:scientific_name]}\t#{citation}\t#{source}\t#{measurementMethod}\t#{literal}\t#{normal_measurement}\t#{normal_units}\t#{o_measurement}\t#{node_params[:page_id].to_i}\t#{node_params[:resource_id].to_i}\t#{measurement["measurementType"]}\t#{object_term_uri}\t#{unit_term_uri}\t#{life_uri}\t#{sex_uri}\t#{statisticalMethod_uri}\t#{object_page_id}"
        
        else
          options = create_measurement(occurrence_of_measurement , measurement)

          if (measurement["measurementOfTaxon"].nil? ||NON_VALID_ARRAY.include?((measurement["measurementOfTaxon"]).downcase)) && !(measurement["parentMeasurementId"].nil?)
            parent_eol_pk = "M_#{measurement["occurrenceId"]}_#{measurement["parentMeasurementId"]}"
          end
          # $meta.write("M_#{measurement["occurrenceId"]}_#{measurement["measurementId"]}\t")          
          if options[:measurement]
            # $meta.write("#{options[:measurement]}")
            options_measurement=options[:measurement] 
          end
          # $meta.write("\t")
          if options[:literal] 
            # $meta.write("#{options[:literal]}")
            options_literal = options[:literal] 
          end
          # $meta.write("\t")
          # $meta.write("#{parent_eol_pk}\t#{node_params[:resource_id]}\t#{options[:predicate_uri]}\t")
          if options[:object_term_uri]
            # $meta.write("#{options[:object_term_uri]}")
            options_object_term_uri=options[:object_term_uri]
          end
          # $meta.write("\t") 
          if options[:units_term_uri]
            # $meta.write("#{options[:units_term_uri]}")
            options_units_term_uri=options[:units_term_uri]
          end
          # $meta.write("\t") 
          # $meta.write("#{measurement["occurrenceId"]}\n")
          # $meta.write("M_#{measurement["occurrenceId"]}_#{measurement["measurementId"]}\t#{options_measurement}\t#{options_literal}\t#{parent_eol_pk}\t#{node_params[:resource_id]}\t#{options[:predicate_uri]}\t#{options_object_term_uri}\to#{ptions_units_term_uri}\t#{measurement["occurrenceId"]}\n")
          $meta_array << "M_#{measurement["occurrenceId"]}_#{measurement["measurementId"]}\t#{options_measurement}\t#{options_literal}\t#{parent_eol_pk}\t#{node_params[:resource_id]}\t#{options[:predicate_uri]}\t#{options_object_term_uri}\t#{options_units_term_uri}\t#{measurement["occurrenceId"]}"
        # else
          # options = create_measurement(occurrence_of_measurement , measurement)
          # # $meta.write("M_#{measurement["occurrenceId"]}_#{measurement["measurementId"]}\t")
          # # if options[:measurement]
            # # $meta.write("#{options[:measurement]}")
          # # end
          # # $meta.write("\t")
          # # if options[:literal] 
            # # $meta.write("#{options[:literal]}") 
          # # end
          # # $meta.write("\t")
          # # $meta.write("\t#{node_params[:resource_id]}\t#{options[:predicate_uri]}\t")
          # # if options[:object_term_uri]
            # # $meta.write("#{options[:object_term_uri]}")
          # # end
          # # $meta.write("\t") 
          # # if options[:units_term_uri]
            # # $meta.write("#{options[:units_term_uri]}")
          # # end
          # # $meta.write("\t") 
          # # $meta.write("#{measurement["occurrenceId"]}\n")
          # if options[:measurement]
            # # $meta.write("#{options[:measurement]}")
            # options_measurement=options[:measurement] 
          # end
          # # $meta.write("\t")
          # if options[:literal] 
            # # $meta.write("#{options[:literal]}")
            # options_literal = options[:literal] 
          # end
          # # $meta.write("\t")
          # # $meta.write("#{parent_eol_pk}\t#{node_params[:resource_id]}\t#{options[:predicate_uri]}\t")
          # if options[:object_term_uri]
            # # $meta.write("#{options[:object_term_uri]}")
            # options_object_term_uri=options[:object_term_uri]
          # end
          # # $meta.write("\t") 
          # if options[:units_term_uri]
            # # $meta.write("#{options[:units_term_uri]}")
            # options_units_term_uri=options[:units_term_uri]
          # end
          # # $meta.write("\t") 
          # # $meta.write("#{measurement["occurrenceId"]}\n")
          # $meta.write("M_#{measurement["occurrenceId"]}_#{measurement["measurementId"]}\t#{options_measurement}\t#{options_literal}\t#{parent_eol_pk}\t#{node_params[:resource_id]}\t#{options[:predicate_uri]}\t#{options_object_term_uri}\toptions_units_term_uri\n")
        end
      end
    end
  end
end

def convert_measurement(options, units)
  return unless options[:literal]
  options[:measurement] = begin
    Integer(options[:literal])
  rescue
    Float(options[:literal]) rescue options[:literal]
  end
  # If we converted it (and thus it is numeric) AND we see units...
  if options[:measurement].is_a?(Numeric) && units 
    (n_val, n_unit) = UnitConversions.convert(options[:measurement],units)
    options[:normal_measurement] = n_val
    options[:normal_units] = n_unit
  else
    options[:normal_measurement] = options[:measurement]
    if units 
      options[:normal_units] = units
    else
      options[:normal_units] = "missing"
    end
  end
end

def numeric?(str)
  Float(str) != nil rescue false
end

def uri?(str)
  if str =~ URI::regexp
    true
  else
    false
  end
end


def main_method_3
  ActiveRecord::Base.logger.info "starttttttt: #{Time.new}"
  nodes_ids = []
  # hashof terms key is uri value is term itself
  terms = {}

  # file_path = File.join(Rails.root, 'lib', 'tasks', 'publishing_api', 'mysql.json')
  # tables = JSON.parse(File.read(file_path))
  # file_path = File.join(Rails.root, 'lib', 'tasks', 'publishing_api', 'articles.json')

  #file_path = File.join(Rails.root, 'lib', 'tasks', 'publishing_api', 'traits_mysql.json')
  #tables = JSON.parse(File.read(file_path))


    # start_harvested_time = "1551795393000"
    # debugger
    if HarvestTime.first.nil?
      HarvestTime.create
    end
    
    start_harvested_time = HarvestTime.first.last_harvest_time
    # debugger
    end_harvested_time = get_end_time
# # finish = 0
    while (start_harvested_time.to_i <= end_harvested_time.to_i) do 
      $terms=File.new("#{NEO4J_IMPORT_PATH}terms.csv", 'w')
      $meta=File.new("#{NEO4J_IMPORT_PATH}meta.csv", 'w')
      $traits=File.new("#{NEO4J_IMPORT_PATH}traits.csv", 'w')
      
    # # start_harvested_time is included 
    # # end_harvested_time is excluded therefore we keep it to next loop
       json_content = get_latest_updates_from_mysql(start_harvested_time, (start_harvested_time.to_i+30000).to_s)
       tables = JSON.parse(json_content)

    licenses = tables["licenses"]
    ranks = tables["ranks"]
    nodes = tables["nodes"]
    pages = tables["pages"]
    pages_nodes = tables["pages_nodes"]
    scientific_names = tables["scientific_names"]
    languages = tables["languages"]
    vernaculars = tables["vernaculars"]
    locations = tables["locations"]
    media = tables["media"]
    articles = tables["articles"]
    page_contents = tables["page_contents"]
    attributions = tables["attributions"]
    referents = tables["referents"]
    references = tables["references"]
    traits = tables["traits"]
    taxa = tables["taxa"]
    unless licenses.nil?
      License.bulk_insert(licenses, :validate => true, :use_provided_primary_key => true)
    end

    unless ranks.nil?
      Rank.bulk_insert(ranks, :validate => true, :use_provided_primary_key => true)
    end

    unless nodes.nil?
      Node.bulk_insert(nodes,:validate => true ,:use_provided_primary_key => true)
    end

    unless pages.nil?
      Page.bulk_insert(pages,:validate => true , :use_provided_primary_key => true)
    end

    unless pages_nodes.nil?
      PagesNode.bulk_insert(pages_nodes,:validate => true , :use_provided_primary_key => true)

    end
    unless scientific_names.nil?
      ScientificName.bulk_insert(scientific_names,:validate => true , :use_provided_primary_key => true)
    end

    unless languages.nil?
      languages.each do |language|
        Language.create(language)
      end
    end

    unless vernaculars.nil?
      Vernacular.bulk_insert(vernaculars,:validate => true , :use_provided_primary_key => true)
    end

    unless locations.nil?
      Location.bulk_insert(locations,:validate => true , :use_provided_primary_key => true)
    end

    unless media.nil?
      Medium.bulk_insert(media,:validate => true , :use_provided_primary_key => true, ignore: true)
    end

    unless articles.nil?
      # debugger
      Article.bulk_insert(articles,:validate => true , :use_provided_primary_key => true, ignore: true)
    end

    unless page_contents.nil?
      PageContent.bulk_insert(page_contents,:validate => true , :use_provided_primary_key => true)
    end

    unless attributions.nil?
      Attribution.bulk_insert(attributions,:validate => true , :use_provided_primary_key => true)
    end

    unless referents.nil?
      Referent.bulk_insert(referents,:validate => true , :use_provided_primary_key => true)
    end

    unless references.nil?
      Reference.bulk_insert(references,:validate => true , :use_provided_primary_key => true)
    end

    nodes_ids = nodes.map { |p| p["generated_node_id"] }
    build_hierarchy(nodes_ids)
    
    unless traits.nil?
      File.open("#{NEO4J_IMPORT_PATH}terms.csv", 'w'){}
      File.open("#{NEO4J_IMPORT_PATH}traits.csv", 'w'){}
      File.open("#{NEO4J_IMPORT_PATH}meta.csv", 'w'){}
      $terms_array.clear
      $traits_array.clear
      $meta_array.clear

      terms = "name\turi\tsection_ids\tdefinition"
      traits_header = "resource_pk\tocc_id\teol_pk\tscientific_name\tcitation\tsource\tmeasurementMethod\tliteral\tnormal_measurement\tnormal_units\tmeasurement\tpage_id\tresource_id\tp_uri\tob_uri\tunit_uri\tlifestage_uri\tsex_uri\tstatisticalMethod_uri\tobject_page_id"
      meta = "eol_pk\tmeasurement\tliteral\tparent_eol_pk\tresource_id\tp_uri\tob_uri\tunit_uri\tocc_id"
      $terms_array << terms
      $traits_array << traits_header
      $meta_array << meta
      # $terms.write("name\turi\tsection_ids\tdefinition\n")
      # $traits.write("resource_pk\tocc_id\teol_pk\tscientific_name\tcitation\tsource\tmeasurementMethod\tliteral\tnormal_measurement\tnormal_units\tmeasurement\tpage_id\tresource_id\tp_uri\tob_uri\tunit_uri\tlifestage_uri\tsex_uri\tstatisticalMethod_uri\tobject_page_id\n")
      # $meta.write("eol_pk\tmeasurement\tliteral\tparent_eol_pk\tresource_id\tp_uri\tob_uri\tunit_uri\tocc_id\n")

      # traits.each do|trait|
        # generated_node_id = trait["generated_node_id"]
        # occurrences = "["+trait["occurrences"]+"]"
        # occurrences = JSON.parse(occurrences)
        # node = Node.where(generated_node_id: generated_node_id).first
        # node_id = node.id
        # resource_id = node.resource_id
        # scientto_datetime.strftime("%Q")ific_name = node.scientific_name
        # page_id = PagesNode.where(node_id: node_id).first.page_id
        # load_occurrence(occurrences, page_id, resource_id)
      # eHarvestTime.first.update_attribute(:last_harvest_time, DateTime.now())nd

      traits.each do|trait|
        generated_node_id = trait["generated_node_id"]
        target_occurrences = trait["targetOccurrences"]
        unless target_occurrences.empty?
          target_occurrences = JSON.parse(target_occurrences)
        end
        occurrences = "["+trait["occurrences"]+"]"
        occurrences = JSON.parse(occurrences)
        associations = "["+trait["associations"]+"]"
        associations = JSON.parse(associations)
        measurements = "["+trait["measurementOrFacts"]+"]"
        measurements = JSON.parse(measurements)
        node = Node.where(generated_node_id: generated_node_id).first
        node_id = node.id
        resource_id = node.resource_id
        scientific_name = node.scientific_name
        page_id = PagesNode.where(node_id: node_id).first.page_id
        node_params = { page_id: page_id, resource_id: resource_id, scientific_name: scientific_name}
        add_neo4j(node_params, occurrences, measurements, associations,target_occurrences,terms)
      end
      
      IO.write($terms, $terms_array.join("\n"))
      IO.write($traits, $traits_array.join("\n"))
      IO.write($meta, $meta_array.join("\n"))

      system('sh /home/a-amorad/traits_scripts/terms.sh')
      system('sh /home/a-amorad/traits_scripts/traits.sh')
      system('sh /home/a-amorad/traits_scripts/meta.sh')

      # system('sh /home/ba/traits_scripts/terms.sh')
      # system('sh /home/ba/traits_scripts/traits.sh')
      # system('sh /home/ba/traits_scripts/meta.sh')


    end
    
    # create maps json file for occurrence_maps

    unless taxa.nil?
      taxa.each do |taxon|
        write_to_json(taxon)
      end
      OccurrenceMap.bulk_insert($occurrence_maps_array, :validate => true)
      $occurrence_maps_count = 0
     end
     
      start_harvested_time = (start_harvested_time.to_i + 30000).to_s
   end
   ActiveRecord::Base.logger.info "enddddddddd: #{Time.new}"
   # debugger
   HarvestTime.first.update_attribute(:last_harvest_time, DateTime.now().strftime("%Q"))
end

 def write_to_json(taxon)
  page_eol_id = taxon["page_eol_id"]
  occurrences = "["+taxon["occurrences"]+"]"
  occurrences = JSON.parse(occurrences)
  occ_count = occurrences.count
  actual_count = 0
  maps_path = Pathname("public/data/maps/"+"#{page_eol_id%100}/")
  unless maps_path.exist?
    FileUtils.mkdir_p maps_path
  end
  #check if the file exists, create new if not, update if already exists
  unless File.exists?("#{maps_path}#{page_eol_id}.json")
    unless occurrences.nil?
      json_path = File.open("#{maps_path}"+"#{page_eol_id}.json","w")
      json_path.sync = true
      json_path.write("{\"records\":[")
      geoLocations = Array.new()
      first = true
      occurrences.each do |occ|
      #check if the coordinates are in Degree, Minute, Hemisphere and convert into decimal format
        if(!occ["decimalLatitude"].nil? && !occ["decimalLongitude"].nil?)
          geoLocation=nil
          if ((!numeric?(occ["decimalLongitude"])) && (!numeric?(occ["decimalLatitude"])))
            unless (occ["decimalLatitude"].include?('-') || occ["decimalLongitude"].include?('-'))
              latitude = validate_coordinates(occ["decimalLatitude"])
              longitude = validate_coordinates(occ["decimalLongitude"])
              geoLocation = Geo::Coord.parse_dms(latitude+','+longitude)
            end
          else
            geoLocation = Geo::Coord.parse_ll("#{occ["decimalLatitude"]},#{occ["decimalLongitude"]}")
          end
          unless geoLocation.nil?
            tempHash = {
              "a" => (occ["catalogNumber"].nil? ? nil : "#{occ["catalogNumber"]}"), #catalog number
              "b" => (taxon["scientific_name"] == "null" ? nil : "#{taxon["scientific_name"]}"), #scientific_name
              "c" => nil, #publisher
              "d" => nil, #publisherId
              "e" => nil, #dataset
              "f" => (taxon["dataset_id"] == "null" ? nil : "#{taxon["dataset_id"]}"), #datasetId
              "g" => (taxon["source"] == "null" ? nil : "#{taxon["source"]}"), #gbifId
              "h" => (occ["decimalLatitude"].nil? ? nil : geoLocation.lat),
              "i" => (occ["decimalLongitude"].nil? ? nil : geoLocation.lng),
              "j" => (occ["recordedBy"].nil? ? nil : "#{occ["recordedBy"]}"), #recordedBy
              "k" => (occ["identifiedBy"].nil? ? nil : "#{occ["identifiedBy"]}"), #identifiedBy
              "l" => nil, #pic_url
              "m" => (occ["eventDate"].nil? ? nil : "#{occ["eventDate"]}") #eventDate
            }
            if first
            json_path.write(tempHash.to_json)
            first = false
            else
              json_path.write(","+tempHash.to_json)
            end
            if (!tempHash["h"].nil?)&&(!tempHash["i"].nil?) #validate decimal longitude and latitude existence
            actual_count +=1
            end
          end
        end
      end
      json_path.write("],\"count\":#{actual_count},\"actual\":#{actual_count}}")
      if (actual_count>0)
        $occurrence_maps_array.insert($occurrence_maps_count,{:resource_id => taxon["resource_id"],:page_id => taxon["page_eol_id"]})
        $occurrence_maps_count+=1
      end
    end

  else
  #append new occurrence records, and update both count and actual
    json_content = JSON.parse(File.read("#{maps_path}#{page_eol_id}.json"))
    records = json_content["records"]
    records_hash = records.first
    count = json_content["count"].to_i
    actual = json_content["actual"].to_i
    unless occurrences.nil?
      json_path_temp = File.open("#{maps_path}#{page_eol_id}_temp.json","w")
      json_path_temp.sync = true
      json_path_temp.write("{\"records\":[")
      first = true
      records.each.with_index do |rec, index|
        first = false
        records_hash = {
          "a" => (rec["a"].nil? ? nil : "#{rec["a"]}"),
          "b" => (rec["b"].nil? ? nil : "#{rec["b"]}"),
          "c" => (rec["c"].nil? ? nil : "#{rec["c"]}"),
          "d" => (rec["d"].nil? ? nil : "#{rec["d"]}"),
          "e" => (rec["e"].nil? ? nil : "#{rec["e"]}"),
          "f" => (rec["f"].nil? ? nil : "#{rec["f"]}"),
          "g" => (rec["g"].nil? ? nil : "#{rec["g"]}"),
          "h" => (rec["h"].nil? ? nil : rec["h"]),
          "i" => (rec["i"].nil? ? nil : rec["i"]),
          "j" => (rec["j"].nil? ? nil : "#{rec["j"]}"),
          "k" => (rec["k"].nil? ? nil : "#{rec["k"]}"),
          "l" => (rec["l"].nil? ? nil : "#{rec["l"]}"),
          "m" => (rec["m"].nil? ? nil : "#{rec["m"]}")
        }
        if index == records.size-1
          json_path_temp.write("#{records_hash.to_json}")
        else
          json_path_temp.write("#{records_hash.to_json},")
        end
      end
      geoLocations = Array.new()
        occurrences.each do |occ|
        #check if the coordinates are in Degree, Minute, Hemisphere and convert into decimal format
          if(!occ["decimalLatitude"].nil? && !occ["decimalLongitude"].nil?)
            geoLocation=nil
            if ((!numeric?(occ["decimalLongitude"])) && (!numeric?(occ["decimalLatitude"])))
              unless (occ["decimalLatitude"].include?('-') || occ["decimalLongitude"].include?('-'))
                latitude = validate_coordinates(occ["decimalLatitude"])
                longitude = validate_coordinates(occ["decimalLongitude"])
                geoLocation = Geo::Coord.parse_dms(latitude+','+longitude)
              end
            else
              geoLocation = Geo::Coord.parse_ll("#{occ["decimalLatitude"]},#{occ["decimalLongitude"]}")
            end
            unless geoLocation.nil?
              tempHash = {
                "a" => (occ["catalogNumber"].nil? ? nil : "#{occ["catalogNumber"]}"), #catalog number
                "b" => (taxon["scientific_name"] == "null" ? nil : "#{taxon["scientific_name"]}"), #scientific_name
                "c" => nil, #publisher
                "d" => nil, #publisherId
                "e" => nil, #dataset
                "f" => (taxon["dataset_id"] == "null" ? nil : "#{taxon["dataset_id"]}"), #datasetId
                "g" => (taxon["source"] == "null" ? nil : "#{taxon["source"]}"), #gbifId
                "h" => (occ["decimalLatitude"].nil? ? nil : geoLocation.lat),
                "i" => (occ["decimalLongitude"].nil? ? nil : geoLocation.lng),
                "j" => (occ["recordedBy"].nil? ? nil : "#{occ["recordedBy"]}"), #recordedBy
                "k" => (occ["identifiedBy"].nil? ? nil : "#{occ["identifiedBy"]}"), #identifiedBy
                "l" => nil, #pic_url
                "m" => (occ["eventDate"].nil? ? nil : "#{occ["eventDate"]}") #eventDate
              }
              if first
              json_path_temp.write(tempHash.to_json)
              first = false
              else
                json_path_temp.write(","+tempHash.to_json)
              end
              if (!tempHash["h"].nil?)&&(!tempHash["i"].nil?) #validate decimal longitude and latitude existence
                actual_count +=1
                actual +=1
              end
            end
          end
        end
        json_path_temp.write("],\"count\":#{actual},\"actual\":#{actual}}")
        File.rename(json_path_temp, "#{maps_path}#{page_eol_id}.json")
        #add entries to occurrence_maps table if the page has valid occurrence plottings for the maps
        if (actual_count>0)
          $occurrence_maps_array.insert($occurrence_maps_count,{:resource_id => taxon["resource_id"],:page_id => taxon["page_eol_id"]})
          $occurrence_maps_count+=1
        end
      end
  end
end

def validate_coordinates (coord)
  if coord.nil?
    return nil
  end
  if ((!coord.include?('°')) || (!coord.include?('\'')) || (!coord.include? ('"')))
    # debugger
    coord.include?('°') ? degrees = (coord.split('°',2)[0]) : degrees="0"
    coord = coord.split('°',2)[1] if coord.include?('°')
    coord.include?('\'') ? minutes = (coord.split('\'',2)[0]) : minutes="0"
    coord = coord.split('\'',2)[1] if coord.include?('\'')
    coord.include?('"') ? seconds = (coord.split('"',2)[0]) : seconds="0"
    coord = coord = coord.split('"',2)[1] if coord.include?('"')
    # convert from degrees to minutes
    if degrees.include?'.'
      degrees_minutes = degrees.split('.')
      degrees = degrees_minutes[0]
      minutes = (("0."+ degrees_minutes[1]).to_f*60)+minutes.to_f
    end
    #convert from minutes to seconds
    if minutes.to_s.include?'.'
      minutes_seconds = minutes.to_s.split('.')
      minutes = minutes_seconds[0]
      seconds = (("0."+ minutes_seconds[1]).to_f*60)+seconds.to_f
    end
  end
  coord =degrees+"°"+minutes.to_s+"'"+seconds.to_s+"\""+coord
end

def main_method_biuld_hierarchy
   start_harvested_time = "1547663631000"
    end_harvested_time = get_end_time
# finish = 0
  while (start_harvested_time.to_i <= end_harvested_time.to_i) do 
    # start_harvested_time is included 
    # end_harvested_time is excluded therefore we keep it to next loop
   json_content = get_latest_updates_from_mysql(start_harvested_time, (start_harvested_time.to_i+30000).to_s)
   tables = JSON.parse(json_content)
   nodes = tables["nodes"]
   unless nodes.nil?
      Node.bulk_insert(nodes,:validate => true ,:use_provided_primary_key => true)
    end
   nodes_ids = nodes.map { |p| p["generated_node_id"] }
   debugger
   build_hierarchy(nodes_ids)
   debugger
   start_harvested_time = (start_harvested_time.to_i + 30000).to_s
  end

end

def build_hierarchy(nodes_ids)
  set_ancestors(nodes_ids)
end

def set_ancestors(nodes_ids)
  # get nodes_parents from neo4j  
  neo4j_uri = "#{NEO4J_ADDRESS}/#{NEO4J_GET_ANCESTORS_OF_NODES_ACTION}"
  
  # nodes_ids.each_slice(1000) do |sub_arr|
    begin    
      request =RestClient::Request.new(
          :method => :post,
          :timeout => -1,
          :url => "#{neo4j_uri}",
          headers: { content_type: 'application/json', accept: 'application/json'},
          :payload =>  nodes_ids.to_json
        )
        
        response = request.execute
        nodes_ids_ancestors = JSON.parse(response.body)
    rescue => e
      false
    end
    
    unless nodes_ids_ancestors.nil?
      
      node_ancestors_count=0
      nodes_ids_ancestors.each do |group|
        current_node = nil
        ancestor_node = nil
        group.each do |key,value|
          res = Node.where(generated_node_id: value.to_i)
          if key.to_i == 0  
            if  res.count > 0 
              current_node = res.first 
            end
          else
            # if res.count > 0 
              # ancestor_node = res.first
              # NodeAncestor.find_or_create_by(node: current_node, ancestor: ancestor_node, depth: key.to_i, resource_id: current_node.resource_id)
            # else
              # node_ancestor = NodeAncestor.where(node_generated_node_id: current_node.generated_node_id, ancestor_generated_node_id: value.to_i, depth: key.to_i, resource_id: current_node.resource_id)
              # unless node_ancestor.count >0
                # NodeAncestor.create(node_generated_node_id: current_node.generated_node_id, ancestor_generated_node_id: value.to_i, depth: key.to_i, resource_id: current_node.resource_id)
              # end
              # NodeAncestor.find_or_create_by(node_generated_node_id: current_node.generated_node_id, ancestor_generated_node_id: value.to_i, depth: key.to_i, resource_id: current_node.resource_id)
              $node_ancestors_array.insert(node_ancestors_count,{:node_generated_node_id => current_node.generated_node_id, :ancestor_generated_node_id => value.to_i, :depth => key.to_i, :resource_id => current_node.resource_id})
              node_ancestors_count = node_ancestors_count + 1
            # end
          end 
        end      
      end
      NodeAncestor.bulk_insert($node_ancestors_array, :validate => true, :disable_timestamps => true)
    end
  # end
end

namespace :harvester do
  desc "TODO"  
  task get_latest_updates: :environment do

    main_method_3
    # main_method_biuld_hierarchy

  end
end
