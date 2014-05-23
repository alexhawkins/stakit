json.array!(@user_attachments) do |user_attachment|
  json.extract! user_attachment, :id, :user_id, :image
  json.url user_attachment_url(user_attachment, format: :json)
end
