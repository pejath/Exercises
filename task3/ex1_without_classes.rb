doc = Nokogiri::XML.parse File.read('cia-1996.xml')
books = doc.css('country')
population = {}
inflation = {}
continents = {}
books.each { |b| population[b['name']] = b['population'].to_i }
p 'POPULATION'
p population.sort_by { |_key, value| value }.reverse[0]
p 'INFLATION'
books.each { |b| inflation[b['name']] = b['inflation'].to_i}
p inflation.sort_by { |_key, value| value }.reverse[0, 4]
p 'CONTINENTS'
books.each{ |b| continents[b['name']] = b['continent']}
continents = continents.safe_invert
p continents.sort_by{ |key, _| key}.to_h
