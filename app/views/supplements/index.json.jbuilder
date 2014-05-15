json.array!(@supplements) do |supplement|
  json.extract! supplement, :id, :name, :default_dose, :default_frequency
  json.url supplement_url(supplement, format: :json)
end
