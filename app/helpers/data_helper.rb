# NOTE that you use the show_* methods with a - not a = because it's writing
# to the stream directly, NOT building an output for you to show...
module DataHelper

  def data_value(data)
    parts = []
    value = t(:data_missing, keys: data.keys.join(", "))
    if (target_id = data[:object_page_id])
      if defined?(@associations)
        target = @associations.find { |a| a.id == target_id }
        if target.nil?
          # TODO: log something?
        else
          parts << name_for_page(target)
        end
      end
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

end
