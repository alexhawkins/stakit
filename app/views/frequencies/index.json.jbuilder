json.array!(@frequencies) do |frequency|
  json.extract! frequency, :id, :value
  json.url frequency_url(frequency, format: :json)
end
