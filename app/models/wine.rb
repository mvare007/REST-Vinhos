class Wine < ApplicationRecord
  include PgSearch::Model

  has_one_attached :photo

  validates :name, presence: true, uniqueness: true
  validates :description, presence: true
  validates :country, presence: true
  validates :region, presence: true
  validates :volume, presence: true

  pg_search_scope :search_by_name, against: [:name],
    using: {
      tsearch: {
        any_word: true,
        prefix: true,
      },
    }

  pg_search_scope :search_by_region, against: [:region],
    using: {
      tsearch: {
        any_word: true,
        prefix: true,
      },
    }

  pg_search_scope :search_by_country, against: [:country],
    using: {
      tsearch: {
        any_word: true,
        prefix: true,
      },
    }


  pg_search_scope :search_by_maker, against: [:maker],
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
