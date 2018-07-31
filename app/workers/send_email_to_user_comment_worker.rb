class SendEmailToUserCommentWorker
  include Sidekiq::Worker

  def perform rating_id, current_user_id
    user_comments = User.by_comment_ratings rating_id, current_user_id
    unless user_comments.nil?
      user_comments.each do |user_comment|
        UserMailer.send_mail_user_comment(user_comment, rating_id).deliver
      end
    end
  end
end
