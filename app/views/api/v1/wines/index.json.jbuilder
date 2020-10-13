json.array! @wines do |wine|
  json.extract! wine,
    :id,
    :name,
    :description,
    :image_url,
    :variant,
    :country,
    :region,
    :volume,
    :maker
end
