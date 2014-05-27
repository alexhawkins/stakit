class Topic < ActiveRecord::Base
  has_many :question_topics, dependent: :destroy
  has_many :questions, through: :question_topics

  def self.tokens(query)
    topics = where("name like?", "%#{query}%")
    if topics.empty?
      [{id: "<<<#{query}>>>", name: "Create New Topic: \"#{query.split.map(&:capitalize).join(' ')}\""}]
    else
      topics
    end
  end

  def self.ids_from_tokens(tokens)
    tokens.gsub!(/<<<(.+?)>>>/) { create!(name: $1.split.map(&:capitalize).join(' ')).id}
    tokens.split(',')
  end
end
