class Wine < ApplicationRecord
  include PgSearch

  has_one_attached :photo

  validates :name, presence: true, uniqueness: true
  validates :description, presence: true

  pg_search_scope :search_by_term, against: [:name, :region, :origin, :maker],
    using: {
      tsearch: {
        any_word: true,
        prefix: true,
      },
    }

  def self.create_from_collection(wine_list)
    wine_list.each do |wine_hash|
      Wine.create(wine_hash)
    end
  end
end
