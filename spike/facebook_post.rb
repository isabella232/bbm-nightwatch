require "koala"

graph = Koala::Facebook::API.new
group_id = ENV["GROUP_ID"]

id = graph.put_connections(group_id, "feed", message: "New post")["id"]

graph.graph_call(id, {message: "Post modified from API"}, "post")

