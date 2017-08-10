module ApplicationHelper
  def format_date(date = DateTime.new)
    date.strftime("%b %d, %Y")
  end

  def full_title(page_title = "")
    base_title = "reddit"
    if page_title.empty?
      base_title
    else
      page_title + " | " + base_title
    end
  end
end
