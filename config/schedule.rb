set :environment, "development"

every "59 23 28-30 * *"  do
  rake "delete_request_accepted"
end

every "0 15 26 * *" do
  rake "send_email_to_admin"
end
