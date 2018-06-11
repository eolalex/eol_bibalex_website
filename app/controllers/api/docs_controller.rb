class Api::DocsController < ApiController
   skip_before_action :set_default_format_to_xml
  
  def pages
  end
  
  def collections
  end
    
  def data_objects
  end
  

  def default_render
    render "api/docs/method_documentation"
  end
end