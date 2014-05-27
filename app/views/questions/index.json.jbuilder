json.array!(@questions) do |question|
  json.extract! question, :id, :name, :description
  json.url question_url(question, format: :json)
end
