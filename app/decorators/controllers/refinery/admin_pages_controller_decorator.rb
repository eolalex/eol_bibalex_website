Refinery::Admin::PagesController.prepend(
  Module.new do
    def permitted_page_params
      super << :show_date
    end
  end
)