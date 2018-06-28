module ApplicationHelper
  def basic_button(icon, label, url, options = {})
    addclass = options.delete(:button_class) || ""
    haml_tag("button.ui.labeled.small.icon.basic.button.uk-margin-small-bottom#{addclass}") do
      haml_tag("i.#{icon}.icon")
      haml_concat(link_to(label, url, options))
    end
  end
end
