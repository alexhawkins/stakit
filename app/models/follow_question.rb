class FollowQuestion < ActiveRecord::Base
  belongs_to :question
  belongs_to :user
  validates_presence_of :question, :user
  has_many :activities, as: :trackable, dependent: :destroy
end
