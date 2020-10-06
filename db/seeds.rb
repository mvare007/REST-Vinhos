# Wine.destroy_all

# scrape = Scraper.new
# puts "Scraping..."
# wines = scrape.scrape_wine_urls

# puts "Almost there..."
# puts wines
# Wine.create_from_collection(wines)
# puts "====================  Done!  ===================="

def api_fix
  Wine.all.each do |wine|
    puts wine
    wine.maker = wine.serv_temp
    wine.description.strip
    wine.save!
    puts wine
  end
end
