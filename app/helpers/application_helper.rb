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

  def content_activity activity
    object_id = activity.historyable_id
    case activity.type_history
      when Settings.mark
        book = Book.find_by id: object_id
        "<p><b>#{link_to activity.user.name, activity.user}</b> #{t "home.mark"} <b>#{link_to book.name, book}</b></p>"
      when Settings.follow
        user = User.find_by id: object_id
        "<p><b>#{link_to activity.user.name, activity.user}</b> #{t "home.follow"} <b>#{link_to user.name, user}</b></p>"
      when Settings.review
        book = Book.find_by id: object_id
        "<p><b>#{link_to activity.user.name, activity.user}</b> #{t "home.review"} <b>#{link_to book.name, book}</b></p>"
    end
  end

  def verify_like history
    current_user.likes.find_by history_id: history.id
  end

  def verify_comment? comment
    current_user == comment.user if logged_in?
  end
end
