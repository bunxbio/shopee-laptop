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

pages << {
  url: 'https://shopee.co.id/Laptop-col.832738?page=0',
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