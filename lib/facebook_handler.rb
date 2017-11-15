require 'koala'
require 'json'
module FacebookHandler
  extend(self)

  def post_to_group(group_id, message, link=nil)
    graph.put_connections(group_id, 'feed', message: message, link: link)['id']
  end

  def update_a_post(post_id, message)
    graph.graph_call(post_id, {message: message}, 'post')['success']
  end

  def comment_on_post(post_id, message)
    graph.put_connections(post_id, 'comments', message: message)
  end

  private

  def graph
    Koala::Facebook::API.new page_access_token, app_secret
  end

  def app_secret
    ENV["APP_SECRET"]
  end

  def page_access_token
    AccessToken.find_by(name: 'page')&.value
  end
end
