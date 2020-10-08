# Wine.destroy_all

# scrape = Scraper.new
# puts "Scraping..."
# wines = scrape.scrape_wine_urls

# puts "Almost there..."
# puts wines
# Wine.create_from_collection(wines)
# puts "====================  Done!  ===================="

# require "open-uri"

# def upload_images
#   count = 0
#   Wine.all.each do |wine|
#     puts wine
#     if wine.photo.attached? && wine.image_url.include?("cloudinary")
#       puts "Photo already attached - #{wine.image_url}"
#     else
#       puts "#{wine.id} #{wine.name}"
#       file = URI.open(wine.image_url)
#       puts "Uploading image..."
#       wine.photo.attach(io: file, filename: "#{wine.name}.jpg", content_type: 'image/jpg')
#       puts "Upload finished!"
#       wine.image_url = Cloudinary::Utils.cloudinary_url(wine.photo.key)
#       wine.save!
#       puts "#{wine.id} #{wine.name} saved!"
#     end
#     count += 1
#     puts count
#   end
# end

# upload_images


