require 'csv'
require 'byebug'

# TODO - let's read/write data from beers.csv
filepath    = 'data/beers.csv'
filepath2 = 'data/beers2.csv'
csv_options = { col_sep: ',', quote_char: '"', headers: :first_row}
csv_options_tab = { col_sep: "\t", quote_char: '"', headers: :first_row}

#col_sep is going to define what seperates the data (can be tab,comma,semi colon)
# quote_char is going to define what envolves the data (can be double quotes,single quotes and tab)
# headers are going to be the first row of the iteration
CSV.foreach(filepath, csv_options_tab) do |row|
  #byebug
  puts "#{row['Name']} | #{row['Appearance']} | #{row['Origin']}"
end

puts "OLD CSV"

### STORE CSV

csv_store_options = { col_sep: "\t", force_quotes: true}


CSV.open(filepath, 'wb', csv_store_options) do |csv|
  csv << ['Name', 'Appearance', 'Origin']
  csv << ['Super Bock', 'Blonde', 'Portugal']
  csv << ['Guinness', 'Stout', 'Ireland']
  csv << ['Chimey', 'Dark', 'Belgium']
end

puts "New CSV with new data"

csv_options_tab = { col_sep: "\t", quote_char: '"', headers: :first_row}

CSV.foreach(filepath, csv_options_tab) do |row|
  #byebug
  puts "#{row['Name']} | #{row['Appearance']} | #{row['Origin']}"
end
