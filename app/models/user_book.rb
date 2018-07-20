class UserBook < ApplicationRecord
  belongs_to :user
  belongs_to :book
  scope :by_book, -> (book_id, user_id){where(book_id: book_id, user_id: user_id)}
  scope :by_mark, -> (user_id, type){where(user_id: user_id, type: true)}
  
  def case_params param
    case param
      when "favorite"
        user_books = UserBook.by_mark(params[:id], "favorite")
      when "reading"
        user_books = UserBook.by_reading(params[:id], "reading")
      when "read"
        user_books = UserBook.by_read(params[:id], "read")
    end
  end
end
