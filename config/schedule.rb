set :environment, "development"

every "59 23 28-30 * *"  do
  rake "remove_request"
end

every "0 15 26 * *" do
  rake "send_email_to_admin"
end
