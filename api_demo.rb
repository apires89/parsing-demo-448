require 'json'
require 'open-uri'
require 'byebug'

# TODO - Let's fetch name and bio from a given GitHub username
#url = 'https://api.github.com/users/ssaunier'

url = 'http://api.icndb.com/jokes/random/5'

url_serialized = open(url).read

#p url_serialized

jokes = JSON.parse(url_serialized)

#byebug

jokes["value"].each_with_index do |joke,index|
  p "#{joke["id"]} - #{joke["joke"]}"
end


# p jokes


