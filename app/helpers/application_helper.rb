module ApplicationHelper
  def set_page_date(date)
    Refinery::Page.where(show_date: true)
  end
end
