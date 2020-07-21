require 'open-uri'
require 'nokogiri'
require 'byebug'

# Let's scrape recipes from http://www.epicurious.com
ingredient = "apple"
url = "https://www.bbcgoodfood.com/search/recipes?query=#{ingredient}"

#open the html file
html_file = open(url).read

#p html_file

#parse the html file
html_doc = Nokogiri::HTML(html_file)

#become kind of an XML File

#p html_doc

#find on the inspector tools on chrome the class of the element that we are looking for

#create an iteration using the search method
#REMEMBER . before class_name

html_doc.search('.teaser-item__title a').each do |element|
  #byebug
  p element.text.strip
end

#byebug

#p ingredient




