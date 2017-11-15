class CommentOnFacebookPostJob < ApplicationJob
  queue_as :facebook

  def perform(post_id, message)
    ::FacebookHandler.comment_on_post post_id, message
  end
end
