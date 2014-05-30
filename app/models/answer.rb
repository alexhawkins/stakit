class Answer < ActiveRecord::Base
  belongs_to :question
  belongs_to :user
  has_many :answer_votes, dependent: :destroy
  default_scope { order('rank DESC') }
  
end
