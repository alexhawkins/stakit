json.array!(@stacks) do |stack|
  json.extract! stack, :id, :name, :user_id
  json.url stack_url(stack, format: :json)
end
