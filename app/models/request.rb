class Request < ApplicationRecord
  has_one_attached :photo

  validates :name, presence: true, uniqueness: true
  validates :description,
              presence: true,
              length: { maximum: 1000, too_long: "%{count} characters is the maximum allowed" }
  validates :country, presence: true
  validates :region, presence: true
  validates :volume,
              presence: true,
              numericality: { only_float: true }
  validates :variant,
              presence: true,
              inclusion: { in: %w(Tinto Branco Rosé Verde Espumante Porto Madeira Moscatel Sobremesa),
                           message: "%{value} is not a valid variant" }
end
