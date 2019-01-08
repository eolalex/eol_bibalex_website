require 'uri'
require 'json'
require 'pathname'
require "date"
require "enumerator"
require "fileutils"
require "yaml"
$sql_commands= File.new('commands.sql', 'w')
$occurrence_maps_count = 0
$occurrence_maps_array = Array.new()

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
  # debugger
  mysql_uri = "#{MYSQL_ADDRESS}#{MYSQL_GET_LATEST_UPDATES_ACTION}"
  begin    
    request =RestClient::Request.new(
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
    request =RestClient::Request.new(
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
  # debugger
    options = { 
                predicate: { name:"predicate_name_#{measurement["measurementId"]}", uri: measurement["measurementType"],
                              section_ids:[1,2,3],definition:"predicate definition"}
                 }
    if numeric?(measurement["measurementValue"])
      options[:measurement] = measurement["measurementValue"]
    elsif uri?(measurement["measurementValue"])
      options[:object_term] = { name: "temp object term_#{measurement["measurementId"]}",
                               uri: measurement["measurementValue"], section_ids:[1,2,3],definition:"object_term definition"}
    else
      #TODO update this part after discussing it with stakeholders
      options[:literal] = measurement["measurementValue"]            
    end
    if measurement["unit"]
      options[:units] = {name: "unit_#{measurement["measurementId"]}",uri: measurement["unit"],
                         section_ids:[1,2,3],definition:"test units"}            
    end
    unless measurement["citation"].nil?
      options[:citation] = measurement["citation"]
    end
    unless measurement["source"].nil?
      options[:source] = measurement["source"]
    end
    unless measurement["measurementMethod"].nil?
      options[:measurementMethod] = measurement["measurementMethod"]
    end
    
    # if occurrence_of_measurement && occurrence_of_measurement["lifeStage"]
      # options[:lifestage_term] = { name: "lifeStage_#{measurement["measurementId"]}",
                             # uri: occurrence_of_measurement["lifeStage"], section_ids:[1,2,3],definition:"lifeStage term object_term definition"}
    # end
#     
    # if occurrence_of_measurement && occurrence_of_measurement["sex"]
      # options[:sex_term] = { name: "sex_#{measurement["measurementId"]}",
                             # uri: occurrence_of_measurement["sex"], section_ids:[1,2,3],definition:"sex term object_term definition"}
    # end
#     
    # if occurrence_of_measurement && occurrence_of_measurement["statisticalMethod"]
      # options[:statistical_method_term] = { name: "statisticalMethod_#{measurement["measurementId"]}",
                             # uri: occurrence_of_measurement["statisticalMethod"], section_ids:[1,2,3],definition:"statisticalMethod term object_term definition"}
    # end
    options
end


def add_neo4j(node_params, occurrences, measurements, associations)

  unless (occurrences.nil? || occurrences.empty?)
    # load occurrences
    occurrences_hash = {}    
    occurrences.each do |occurrence|
      occurrences_hash[occurrence["occurrenceId"]] = occurrence
    end
    

    page = TraitBank.create_page(node_params[:page_id].to_i)
    resource = TraitBank.create_resource(node_params[:resource_id].to_i)
    unless (associations.nil? || associations.empty?)
      # debugger
      associations.each do |association|
        res = OccurrencePageMapping.where(resource_id: node_params[:resource_id], occurrence_id: association["targetOccurrenceId"])
        unless res.empty?
          occurrence_mapping = res.first
          object_page_id = occurrence_mapping.page_id
        end
        options = { supplier: { "data" => { "resource_id" =>node_params[:resource_id] } },
                      resource_pk: association["associationId"].to_i, page: node_params[:page_id] ,
                      occurrence_id:association["occurrenceId"],
                      eol_pk: "A_#{association["occurrenceId"]}_#{association["associationId"]}",
                      # eol_pk: "\"#{measurement["occurrenceId"]}\"", 
                      scientific_name: node_params[:scientific_name], object_page_id: object_page_id,
                      predicate: { name: "predicate_name_#{association["associationId"]}", uri: association["associationType"], section_ids:[1,2,3],definition:"predicate definition"}
                       }
                       
          occurrence_of_association = occurrences_hash[association["occurrenceId"]]
          if occurrence_of_association && occurrence_of_association["sex"]
            options[:sex_term] = { name: "sex_#{association["associationId"]}",
                                   uri: occurrence_of_association["sex"], section_ids:[1,2,3],definition:"sex term object_term definition"}
          end
          
          if occurrence_of_association && occurrence_of_association["lifeStage"]
            options[:lifestage_term] = { name: "lifeStage_#{association["associationId"]}",
                                   uri: occurrence_of_association["lifeStage"], section_ids:[1,2,3],definition:"lifeStage term object_term definition"}
          end
          
          # if occurrence_of_association && occurrence_of_association["statisticalMethod"]
            # options[:statistical_method_term] = { name: "statisticalMethod_#{association["associationId"]}",
                                   # uri: occurrence_of_association["statisticalMethod"], section_ids:[1,2,3],definition:"statisticalMethod term object_term definition"}
          # end
          unless association["citation"].nil?
            options[:citation] = association["citation"]
          end
          unless association["source"].nil?
            options[:source] = association["source"]
          end
          unless association["measurementMethod"].nil?
            options[:measurementMethod] = association["measurementMethod"]
          end
          trait=TraitBank.create_trait(options)
      end
    end
    
    unless (measurements.nil? || measurements.empty?)
      measurements_array = []
      measurements.each do |measurement|
        occurrence_of_measurement = occurrences_hash[measurement["occurrenceId"]]
        
        
        # if measurement["measurementOfTaxon"] == "true" || measurement["measurementOfTaxon"] == "TRUE" || measurement["measurementOfTaxon"].nil?

        if (!measurement["measurementOfTaxon"].nil?) && (VALID_ARRAY.include?((measurement["measurementOfTaxon"]).downcase))    
          options = create_measurement(occurrence_of_measurement , measurement)
          options[:supplier] = { "data" => { "resource_id" =>node_params[:resource_id] } }
          options[:resource_pk] =  measurement["measurementId"]
          options[:page] = node_params[:page_id]
          options[:eol_pk] = "M_#{measurement["occurrenceId"]}_#{measurement["measurementId"]}"
          # options[:eol_pk] = "\"#{measurement["occurrenceId"]}\""
          options[:scientific_name] =  node_params[:scientific_name]
          options[:occurrence_id]= measurement["occurrenceId"]
          
          if occurrence_of_measurement && occurrence_of_measurement["lifeStage"]
            options[:lifestage_term] = { name: "lifeStage_#{measurement["measurementId"]}",
                             uri: occurrence_of_measurement["lifeStage"], section_ids:[1,2,3],definition:"lifeStage term object_term definition"}
          end
    
          if occurrence_of_measurement && occurrence_of_measurement["sex"]
            options[:sex_term] = { name: "sex_#{measurement["measurementId"]}",
                                   uri: occurrence_of_measurement["sex"], section_ids:[1,2,3],definition:"sex term object_term definition"}
          end
  
          if measurement["statisticalMethod"]
            options[:statistical_method_term] = { name: "statisticalMethod_#{measurement["measurementId"]}",
                                   uri: measurement["statisticalMethod"], section_ids:[1,2,3],definition:"statisticalMethod term object_term definition"}
          end
          trait=TraitBank.create_trait(options)

        # elsif (measurement["measurementOfTaxon"] == "false" || measurement["measurementOfTaxon"] == "FALSE") && !(measurement["parentMeasurementId"].nil?)
        elsif (measurement["measurementOfTaxon"].nil? ||NON_VALID_ARRAY.include?((measurement["measurementOfTaxon"]).downcase)) && !(measurement["parentMeasurementId"].nil?)
            # debugger
          measurements_array << measurement
        else
           # debugger
          measurements_array << measurement
 
        end
      end
      
      measurements_array.each do |measurement|
        occurrence_of_measurement = occurrences_hash[measurement["occurrenceId"]]
        options = create_measurement(occurrence_of_measurement , measurement)
        # if (measurement["measurementOfTaxon"] == "false" || measurement["measurementOfTaxon"] == "FALSE") && !(measurement["parentMeasurementId"].nil?)
        if (measurement["measurementOfTaxon"].nil? || NON_VALID_ARRAY.include?((measurement["measurementOfTaxon"]).downcase)) && !(measurement["parentMeasurementId"].nil?)
            #Update this condidtion to insert metadata of a given measurement : measurementOfTaxon = true and measurementparent is not null
          parent_eol_pk = "M_#{measurement["occurrenceId"]}_#{measurement["parentMeasurementId"]}"
          res = TraitBank.find_trait(parent_eol_pk, node_params[:resource_id]) 

          # options.each { |md| TraitBank.add_metadata_to_trait(res, md) }
          # options[:eol_pk]= measurement["measurementId"]
          options[:eol_pk] = "M_#{measurement["occurrenceId"]}_#{measurement["measurementId"]}"
          TraitBank.add_metadata_to_trait(res, options)
          
        else
          # debugger
          traits = TraitBank.find_traits(measurement["occurrenceId"], node_params[:resource_id]) 
          traits.each do |element|
            # debugger
            # options[:eol_pk]= measurement["measurementId"]
            options[:eol_pk] = "M_#{measurement["occurrenceId"]}_#{measurement["measurementId"]}"
            options_copy = options.clone
            TraitBank.add_metadata_to_trait(element, options_copy)
            # options.each { |md| TraitBank.add_metadata_to_trait(element, md) }
          end   
        end
      end
      
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
  # $sql_commands.write("use ba_eol_development;\n")
  nodes_ids = []
  
  # file_path = File.join(Rails.root, 'lib', 'tasks', 'publishing_api', 'mysql.json')
  # tables = JSON.parse(File.read(file_path))
  # file_path = File.join(Rails.root, 'lib', 'tasks', 'publishing_api', 'articles.json')

  # file_path = File.join(Rails.root, 'lib', 'tasks', 'publishing_api', 'traits_mysql.json')

  # tables = JSON.parse(File.read(file_path))

   # start_harvested_time = "1540211584000"

   # start_harvested_time = "1544350385000"
  # # end_harvested_time = "1540400200000"
    # end_harvested_time = get_end_time

   # start_harvested_time = "1545246841000"
  # end_harvested_time = "1546148395980"
    end_harvested_time = get_end_time
    start_harvested_time = "1545735517000"
    # end_harvested_time = "1545735819000"

  # debugger

# finish = 0
  while (start_harvested_time.to_i <= end_harvested_time.to_i) do 
  # while(finish == 0)
    #start_harvested_time is included 
    #end_harvested_time is excluded therefore we keep it to next loop
     json_content = get_latest_updates_from_mysql(start_harvested_time, (start_harvested_time.to_i+30000).to_s)

    # json_content = get_latest_updates_from_mysql(start_harvested_time, end_harvested_time)
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
   # debugger

    unless traits.nil?
      traits.each do|trait|
        generated_node_id = trait["generated_node_id"]
        occurrences = "["+trait["occurrences"]+"]"
        occurrences = JSON.parse(occurrences)
        node = Node.where(generated_node_id: generated_node_id).first
        node_id = node.id
        resource_id = node.resource_id
        scientific_name = node.scientific_name
        page_id = PagesNode.where(node_id: node_id).first.page_id
        load_occurrence(occurrences, page_id, resource_id)
      end
      
      traits.each do|trait|   
        generated_node_id = trait["generated_node_id"]
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
        add_neo4j(node_params, occurrences, measurements, associations)
      end
      end

    # create maps json file for occurrence_maps
    unless taxa.nil?
      taxa.each do |taxon|
        write_to_json(taxon)
      end
      OccurrenceMap.bulk_insert($occurrence_maps_array)
      $occurrence_maps_count = 0           
    end
#       
    # end
   

  
    # build_hierarchy(nodes_ids)
    

     start_harvested_time = (start_harvested_time.to_i + 30000).to_s
     # finish = 1

end


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
            json_path.sync=true
            json_path.write("{\"records\":[")
            occurrences.each do |occ|
              tempHash = {
                "a" => (occ["catalogNumber"].nil? ? nil : "#{occ["catalogNumber"]}"), #catalog number
                "b" => (taxon["scientific_name"] == "null" ? nil : "#{taxon["scientific_name"]}"), #scientific_name
                "c" => nil, #publisher
                "d" => nil, #publisherId
                "e" => nil, #dataset
                "f" => (taxon["dataset_id"] == "null" ? nil : "#{taxon["dataset_id"]}"), #datasetId
                "g" => (taxon["source"] == "null" ? nil : "#{taxon["source"]}"), #gbifId
                "h" => (occ["decimalLatitude"].nil? ? nil : occ["decimalLatitude"]),
                "i" => (occ["decimalLongitude"].nil? ? nil : occ["decimalLongitude"]),
                "j" => (occ["recordedBy"].nil? ? nil : "#{occ["recordedBy"]}"), #recordedBy
                "k" => (occ["identifiedBy"].nil? ? nil : "#{occ["identifiedBy"]}"), #identifiedBy
                "l" => nil, #pic_url
                "m" => (occ["eventDate"].nil? ? nil : "#{occ["eventDate"]}") #eventDate
                }
              if (!tempHash["h"].nil?)&&(!tempHash["i"].nil?) #validate decimal longitude and latitude existence
                 actual_count +=1
              end
              json_path.write(tempHash.to_json)
              occ_count-=1
              if occ_count>=1
                json_path.write(",")
              end
           end
            json_path.write("],\"count\":#{occurrences.count},\"actual\":#{actual_count}}")
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
            json_path_temp.sync=true
            json_path_temp.write("{\"records\":[")
            records.each do |rec|
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
                json_path_temp.write("#{records_hash.to_json},")
              end
            occurrences.each do |occ|
              tempHash = {
                "a" => (occ["catalogNumber"].nil? ? nil : "#{occ["catalogNumber"]}"), #catalog number
                "b" => (taxon["scientific_name"] == "null" ? nil : "#{taxon["scientific_name"]}"), #scientific_name
                "c" => nil, #publisher
                "d" => nil, #publisherId
                "e" => nil, #dataset
                "f" => (taxon["dataset_id"] == "null" ? nil : "#{taxon["dataset_id"]}"), #datasetId
                "g" => (taxon["source"] == "null" ? nil : "#{taxon["source"]}"), #gbifId
                "h" => (occ["decimalLatitude"].nil? ? nil : occ["decimalLatitude"]),
                "i" => (occ["decimalLongitude"].nil? ? nil : occ["decimalLongitude"]),
                "j" => (occ["recordedBy"].nil? ? nil : "#{occ["recordedBy"]}"), #recordedBy
                "k" => (occ["identifiedBy"].nil? ? nil : "#{occ["identifiedBy"]}"), #identifiedBy
                "l" => nil, #pic_url
                "m" => (occ["eventDate"].nil? ? nil : "#{occ["eventDate"]}") #eventDate
                }
              if (!tempHash["h"].nil?)&&(!tempHash["i"].nil?) #validate decimal longitude and latitude existence
                 actual_count+=1
                 actual+=1
              end
              json_path_temp.write("#{tempHash.to_json}")
            occ_count-=1
              if occ_count>=1
                json_path_temp.write(",")
              end
             end
        json_path_temp.write("],\"count\":#{occurrences.count+count},\"actual\":#{actual}}")
        File.rename(json_path_temp, "#{maps_path}#{page_eol_id}.json")
        #add entries to occurrence_maps table if the page has valid occurrence plottings for the maps
        if (actual_count>0)
          $occurrence_maps_array.insert($occurrence_maps_count,{:resource_id => taxon["resource_id"],:page_id => taxon["page_eol_id"]})
          $occurrence_maps_count+=1
        end
end
end
end


namespace :harvester do
  desc "TODO"  
  task get_latest_updates: :environment do
    
    main_method_3



  end
end