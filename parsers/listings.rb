nokogiri = Nokogiri.HTML(content)

disable_script = "await sleep(2000);
await page.evaluate('window.scrollBy(0,1200)'); await sleep(1000);  
await page.evaluate('window.scrollBy(0,1200)'); await sleep(1000);
await page.evaluate('window.scrollBy(0,1200)'); await sleep(1000);
await page.evaluate('window.scrollBy(0,1200)'); await sleep(1000);
await page.evaluate('window.scrollBy(0,1200)'); await sleep(1000);
await page.evaluate('window.scrollBy(0,1200)'); await sleep(1000);
await page.evaluate('window.scrollBy(0,1200)'); await sleep(1000);
await page.evaluate('window.scrollBy(0,1200)'); await sleep(1000);
await page.evaluate('window.scrollBy(0,1200)'); await sleep(1000);
await page.evaluate('window.scrollBy(0,1200)'); await sleep(1000);
await page.evaluate(() => {
    for (const script of document.querySelectorAll('script[data-webfe]')) {
        script.parentNode.removeChild(script);
    }
  });
await sleep(1000);
"

products = nokogiri.css('div.col-xs-2-4 a')

products.each do |i|
	a_element = i ? i['href'].split('?').first : nil
	if a_element
		url = "https://shopee.co.id#{a_element}"
		pages << {
			url: url,
			page_type: 'products',
			fetch_type: 'browser',
			method: 'GET',
			force_fetch: true,
			headers: {
				"User-Agent" => "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36"
			},
			driver: {
				enable_images: true,
				code: disable_script
			}
		}
	end
end


LIMIT_PAGE = 10
current_page_url = page['url'].to_s
current_page_num = current_page_url.scan(/\d+/).last.to_i
next_page = "https://shopee.co.id/Laptop-col.832738?page=#{current_page_num + 1}"

if current_page_num <= LIMIT_PAGE
	pages << {
		url: next_page,
		page_type: 'listings',
		fetch_type: 'browser',
		method: 'GET',
		force_fetch: true,
		headers: {
			"User-Agent" => "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36"
		},
		driver: {
			enable_images: true,
			code: disable_script
		}
	}
end