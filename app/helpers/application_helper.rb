module ApplicationHelper
  def basic_button(icon, label, url, options = {})
    addclass = options.delete(:button_class) || ""
    haml_tag("button.ui.labeled.small.icon.basic.button.uk-margin-small-bottom#{addclass}") do
      haml_tag("i.#{icon}.icon")
      haml_concat(button_to(label, url, options))
    end
  end

  def set_page_date(date)
    Refinery::Page.where(show_date: true)
  end

  def resource_error_messages(resource)
    return "" if resource.errors.empty?

    messages = resource.errors.full_messages.map { |msg| content_tag(:li, msg) }.join
    sentence = I18n.t("errors.messages.not_saved",
    count: resource.errors.count,
    resource: resource.class.model_name.human.downcase)

    html = <<-HTML
    <div id="error_explanation" class="bg-danger errorMsg">
      <b>#{sentence}</b>
      <ul>#{messages}</ul>
    </div>
    HTML

    html.html_safe
  end

  def flash_class(level)
    case level
    when :notice then "alert alert-info"
    when :success then "alert alert-success"
    when :error then "alert alert-error"
    when :alert then "alert alert-error"
    end
  end

  def url_without_locale_params(url)
    uri = URI url
    params = Rack::Utils.parse_query uri.query
    params.delete 'locale'
    uri.query = params.to_param
    uri.to_s.chomp("?")
  end
end