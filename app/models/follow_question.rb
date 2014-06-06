class FollowQuestion < ActiveRecord::Base
  belongs_to :question
  belongs_to :user
  validates :user, presence: true
  validates :question, presence: true
  validates :user_id, uniqueness: { scope: :question_id }
  has_many :activities, as: :trackable, dependent: :destroy
end
