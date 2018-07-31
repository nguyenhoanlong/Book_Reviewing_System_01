task delete_request_accepted: :environment do
  Request.remove_request_accepted
end
