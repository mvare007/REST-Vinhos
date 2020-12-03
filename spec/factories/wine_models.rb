FactoryBot.define do
  factory :wine do
    name { (1989..2020).to_s + " " + Faker::Name.unique.name }
    description { Faker::Lorem.words(number: 5) }
    image_url { Faker::Placeholdit.image(size: '50x50') }
    variant { ["Tinto", "Branco", "Rosé", "Verde", "Espumante", "Sobremesa"].sample }
    country { "Portugal" }
    region { "Alentejo" }
    volume { (12.0..15.0).to_s }
    maker { Faker::Superhero.name }
  end
end
