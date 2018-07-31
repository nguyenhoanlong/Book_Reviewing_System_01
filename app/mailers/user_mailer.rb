class UserMailer < ApplicationMailer
  def account_activation user
    @user = user
    mail to: user.email, subject: (t "mailer.user_mailer.account_activation")
  end

  def mail_to_user_request request
    @user = request.user
    @request = request
    mail to: @user.email, subject: (t "email.subject_request_new_book")
  end

  def send_mail_user_comment user, rating_id
    @user = user
    @rating = Rating.find_by id: rating_id
    @book = @rating.book
    mail to: @user.email, subject: (t "email.subject_new_comment")
  end
end
