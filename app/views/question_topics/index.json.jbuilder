json.array!(@question_topics) do |question_topic|
  json.extract! question_topic, :id, :topic_id, :question_id
  json.url question_topic_url(question_topic, format: :json)
end
