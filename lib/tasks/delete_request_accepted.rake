task delete_request: :environment do
  Request.remove_request_accepted
end
