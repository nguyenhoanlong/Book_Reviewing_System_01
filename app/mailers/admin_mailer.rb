class AdminMailer < ApplicationMailer
  def send_email_to_admin user
    @user = user
    mail to: user.email, subject: (t "email.handle_request_new_book")
  end

  def request_admin_handle_new_book
    unless Request.pending.nil?
      admins = User.admin
      admins.each do |admin|
        self.send_email_to_admin(admin).deliver
      end
    end
  end
end
