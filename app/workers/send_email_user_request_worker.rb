class SendEmailUserRequestWorker
  include Sidekiq::Worker

  def perform id
    @request = Request.find_by id: id
    @request.send_email_to_user_request if @request.nil?
  end
end