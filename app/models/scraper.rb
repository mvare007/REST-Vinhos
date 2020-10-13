require 'pry'
require 'nokogiri'
require 'open-uri'

class Scraper
  def scrape_wine_urls
    page_count = 1
    wine_urls = []

    while page_count < 136

      base_url = "https://www.garrafeiranacional.com/vinho.html?p=#{page_count}"
      doc = Nokogiri::HTML(open(base_url, "User-Agent" => "Googlebot"))
      wine_url = doc.css('.prod_table').css('a')

      wine_url.each do |wine|
        url = wine.attribute('href').value
        wine_urls << url
      end

      page_count += 1
    end

    scrape_wine_pages(wine_urls)
  end

  def scrape_wine_pages(wine_urls)
    wines = []

    wine_urls.each do |url|
      sleep(8)
      doc = Nokogiri::HTML(open(url, "User-Agent" => "Googlebot"))
      wine_name = doc.css('.base').children.text
      wine_description = doc.css('.product-description-height').text
      wine_specs = doc.css('.char_name').css('p').css('a').children
      wine_variant = wine_specs[0].to_s.strip
      wine_grade = wine_specs[2].to_s.strip
      wine_country_of_origin = wine_specs[1].to_s.strip
      wine_region = wine_specs[4].to_s.strip
      wine_maker = wine_specs[5].to_s.strip
      wine_serve_temp = wine_specs[6].to_s.strip
      wine_image_url = doc.css('.gallery_main_image').css('img').attribute('src').value

      wine_info = {
        name: wine_name,
        description: wine_description,
        variant: wine_variant,
        volume: wine_grade,
        country: wine_country_of_origin,
        region: wine_region,
        maker: wine_maker,
        image_url: wine_image_url,
      }
      puts wine_info

      wines << wine_info
      puts wines.count
    end

    wines
  end
end

scrape = Scraper.new
puts "Scraping..."
scrape.scrape_wine_urls
