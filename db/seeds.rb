require 'rest-client'

# saves the get request to a variable
tv_list_data = RestClient.get 'http://api.tvmaze.com/shows'

# parse the data and save to JSON
tl_array = JSON.parse(tv_list_data)

# map the JSON to my Show properties created within the migration
tl_array.each do |athing|
  Show.create(
    url: athing["url"],
    name: athing["name"],
    network: athing["network"]["name"],
    image: athing["image"]["medium"]
  )
end
