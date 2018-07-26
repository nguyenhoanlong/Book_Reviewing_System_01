task send_email_to_admin: :environment do
  AdminMailer.request_admin_handle_new_book.deliver
end
