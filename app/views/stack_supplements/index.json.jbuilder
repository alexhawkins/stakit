json.array!(@stack_supplements) do |stack_supplement|
  json.extract! stack_supplement, :id, :stack_id, :supplement_id, :frequency_id, :dose
  json.url stack_supplement_url(stack_supplement, format: :json)
end
