require 'json'
require 'byebug'

# TODO - let's read/write data from beers.json
filepath    = 'data/beers.json'
filepath_2 = 'data/beers_2.json'

#READ FILE

beers = File.read(filepath)

p beers

#PARSE THE FILE INFO

jsonbeers = JSON.parse(beers)

p jsonbeers
#byebug
#jsonbeers

jsonbeers["beers"].each do |beer|
  puts "#{beer["name"]} | #{beer["appearance"]} | #{beer["origin"]}"
end

#### WRITE A JSON

beers = { beers: [
  {
    name:       'Edelweiss',
    appearance: 'White',
    origin:     'Austria'
  },
  {
    name:       'Guinness',
    appearance: 'Stout',
    origin:     'Ireland'
  }
]}

File.open(filepath_2, 'wb') do |file|
  file.write(JSON.generate(beers))
end
