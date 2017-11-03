require 'koala'
require 'json'
module FacebookHandler
  extend(self)

  def post_to_group(group_id, message)
    graph.new.put_connections(group_id, 'feed', message: message)['id']
  end

  def update_a_post(post_id)
    graph.graph_call(post_id, { message: 'Post modified from API' }, 'post')['success']
  end

  private

  def graph
    Koala::Facebook::API.new
  end
end
