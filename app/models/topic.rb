class Topic < ActiveRecord::Base
  has_many :question_topics, dependent: :destroy
  has_many :questions, through: :question_topics
  validates :name, length: {
    minimum: 3,
    maximum: 30,
    too_short: "must have at least 3 characters",
    too_long: "must have less than 30 characters",
    presence: true 
  }

  scope :alphabetically, -> { order('title ASC') }

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
