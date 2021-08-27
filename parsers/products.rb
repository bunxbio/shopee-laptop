nokogiri = Nokogiri.HTML(content)

product = {}

product['title'] = nokogiri.at_css('.attM6y span').text.strip

current_price = nokogiri.at_css('.Ybrg9j').text.strip.gsub('Rp', '')
if current_price.include? '.'
	current_price = current_price.gsub('.', '')
end
product['current_price'] = current_price

discount_check = nokogiri.at_css('._3LRxdy')
discount = discount_check ? discount_check.text.strip.split(' ').first : nil
product['discount'] = discount

original_price_check = nokogiri.at_css('._2MaBXen')
original_price_check = original_price_check ? original_price_check : nokogiri.at_css('._2MaBXe')
if original_price_check
	original_price = original_price_check.text.strip.gsub('Rp', '')
	if original_price.include? '.'
		original_price = original_price.gsub('.', '').to_i
	else
		original_price = original_price.to_i
	end
elsif !original_price_check
	original_price = nil
end
product['original_price'] = original_price

rating_check = nokogiri.at_css('._1mYa1t')
rating = rating_check ? rating_check.text.strip.to_f : nil
product['rating'] = rating == 0 ? nil : rating

reviews_count_check = nokogiri.at_css('div._3A3c6_:nth-child(2) .OitLRu')
reviews_count = reviews_count_check ? reviews_count_check.text.strip.to_i : nil
product['reviews_count'] = reviews_count == 0 ? nil : reviews_count

orders_count_check = nokogiri.at_css('.aca9MM')
orders_count = orders_count_check ? orders_count_check.text.strip.to_i : nil
product['orders_count'] = orders_count == 0 ? nil : orders_count

stock_check = nokogiri.at_css('._90fTvx > div:nth-child(2) > div:nth-child(2)')
stock = stock_check ? stock_check.text.scan(/\d+/).first.to_i : nil
product['stock'] = stock

img_url = nokogiri.at_css('._3Q7kBy')
img_url = img_url ? img_url.attr('style') : nokogiri.at_css('._3-_YTZ div div._12uy03').attr('style')
product['img_url'] = img_url.to_s.scan(/https?[^"]*/).first

product['seller'] = nokogiri.at_css('._3uf2ae').text.strip

product['url'] = page['url']

product['_collection'] = 'products'

outputs << product