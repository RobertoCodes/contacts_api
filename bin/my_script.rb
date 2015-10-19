require 'addressable/uri'
require 'rest-client'


# url = Addressable::URI.new(
#   scheme: 'http',
#   host: 'localhost',
#   port: 3000,
#   path: '/contacts/2',
#   query_values: {
#     'some_category[a_key]' => 'another value',
#     'some_category[a_second_key]' => 'yet another value',
#     'some_category[inner_inner_hash][key]' => 'value',
#     'something_else' => 'aaahhhhh'
#   }
# ).to_s
#
# puts RestClient.get(url)


def create_user
  url = Addressable::URI.new(
    scheme: 'http',
    host: 'localhost',
    port: 3000,
    path: '/contacts/1/toggle_favorite'
  ).to_s

  puts RestClient.patch(
    url,
    { contact: { name: "Gizmo", email: "gizmo@gizmo.com" } }
  )
end

create_user
