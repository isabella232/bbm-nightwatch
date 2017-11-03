require 'koala'

Koala.configure do |config|
  config.access_token = 'EAAFOGP33ALcBAMjrZAZBggUhIheCvLeHRefD7ls3ZBUztPZC8cykNZAAo1GxxHVqZCXHWZCcnNKdKry1iz3sSFyhWVErZC1v9SoaAOMNR7i0ZBI3ZBZAWbiZCs4eNciQhjBZAjrs1wZCO3eNvr39XdoMfzrBIIM33syY62PiZBzjpSyzUcrI5NdlAJQ8DuZCJcK2e9RdQtrbQM609DJOZBQZDZD'
  config.app_access_token = '367344223715511 | p4g1rvSvFY88xJp2KqPHqEGoU5E'
  config.app_id = '367344223715511'
  config.app_secret = '3875b290d7c8e626ec4c14f4808c8627'
end

group_id = "735004416698494"
graph = Koala::Facebook::API.new

id = graph.put_connections(group_id, 'feed', message: 'New post')['id']

p graph.graph_call(id, {}, 'get')
msg = graph.graph_call(id, { message: 'Post modified from API' }, 'post')

p msg.class
p msg
