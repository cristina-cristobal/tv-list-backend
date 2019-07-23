require 'rest-client'

# saves the get request to a variable
tv_list_data = RestClient.get 'http://api.tvmaze.com/shows'

# parse the data and save to JSON
tl_array = JSON.parse(tv_list_data)
byebug

# map the JSON to my Show properties created within the migration
tl_array.each do | show |
  Show.create(
    url: show["url"],
    name: show["name"],
    network: show["network"]["name"],
    image: show["image"]["medium"]
  )
end
