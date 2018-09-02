# NOTE that you use the show_* methods with a - not a = because it's writing
# to the stream directly, NOT building an output for you to show...
module DataHelper
  
  def build_associations(page)
    @associations =
      begin
        ids = page.data.map { |t| t[:object_page_id] }.compact.sort.uniq
        Page.where(id: ids)
        # .
          # includes(:medium, :preferred_vernaculars, native_node: [:rank])
      end
  end

  def data_value(data)    
    parts = []
    value = t(:data_missing, keys: data.keys.join(", "))
    if @associations && (target_id = data[:object_page_id])
      page = @associations.find { |a| a.id == target_id }
      unless page
        Rails.logger("**** INEFFICIENT! Loading association for trait #{data[:eol_pk]}")
        page = Page.find(data[:object_page_id])
      end
      return link_to(page.scientific_name, page_overview_path(page))
      # parts << link_to(page.scientific_name, page_overview_path(page))
    elsif data[:object_term] && data[:object_term][:name]
      value = data[:object_term][:name]
      parts << value
    elsif val = data[:measurement] || data[:value_measurement]
      parts << val.to_s
      parts << data[:units][:name] if data[:units] && data[:units][:name]
    elsif val = data[:literal]
      parts << unlink(val).html_safe
    else
      parts << "CORRUPTED VALUE:"
      parts <<  value
    end

    parts.join(" ")
  end

  def show_data_value(data)
    value = data_value(data)

    haml_tag_if(data[:object_term], ".a") do
      haml_concat value
    end
  end


  def show_source_segment(data)
    if resource = @resources
      content_partner=ContentPartnerApi.get_content_partner_resource_id(resource["id"])
      link_to(resource["name"], content_partner_resource_path(content_partner["id"], resource["id"]))
    else
      I18n.t(:resource_missing)
    end
  end
  
  def modifier_txt(data)
    # TODO: I am not confident enough to do this right now (demo tonight), but IO think this #reject should be #compact
    modifiers = [ data[:sex_term], data[:lifestage_term], data[:statistical_method_term] ].reject { |x| x.nil? }

    if modifiers.any?
      separated_list(modifiers)
    else
      nil
    end
  end

end
