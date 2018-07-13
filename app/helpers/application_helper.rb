module ApplicationHelper
  def index_record index, per_page, page
    page >= 2 ? (page.to_i - 1) * per_page.to_i + index.to_i + 1 : index + 1
  end

  def full_title page_title = ""
    base_title = t "layout.header.title"
    if page_title.empty?
      base_title
    else
      page_title + " | " + base_title
    end
  end
end
