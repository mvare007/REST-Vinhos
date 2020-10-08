if @wines
  json.array! @wines do |wine|
    json.extract! wine,
      :id,
      :name,
      :description,
      :image_url,
      :variant,
      :origin,
      :region,
      :grade,
      :maker
  end
else
  @wines = []
end
