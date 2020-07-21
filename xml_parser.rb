require 'nokogiri'

###OPENING

file      = File.open('data/beers.xml')
document  = Nokogiri::XML(file)

document.root.xpath('beer').each do |beer|
  name        = beer.xpath('name').text
  appearance  = beer.xpath('appearance').text
  origin      = beer.xpath('origin').text

  puts "#{name}, a #{appearance} beer from #{origin}"
end


#### STORING

filepath  = 'beers.xml'
builder   = Nokogiri::XML::Builder.new(encoding: 'UTF-8') do
  beers do
    beer do
      name        'Edelweiss'
      appearance  'White'
      origin      'Austria'
    end
    beer do
      # [...]
    end
  end
end

File.open(filepath, 'wb') { |file| file.write(builder.to_xml) }
