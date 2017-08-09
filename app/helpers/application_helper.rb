module ApplicationHelper
  def format_date(date = DateTime.new)
    date.strftime("%b %d, %Y")
  end
end
