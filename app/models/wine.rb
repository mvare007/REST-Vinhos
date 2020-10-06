class Wine < ApplicationRecord
  def self.create_from_collection(wine_list)
    wine_list.each do |wine_hash|
      Wine.create(wine_hash)
    end
  end
end
