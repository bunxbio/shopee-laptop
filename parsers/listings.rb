nokogiri = Nokogiri.HTML(content)

products = nokogiri.css('li.Grid-col')