class Activity < ActiveRecord::Base
  belongs_to :user
  belongs_to :trackable, polymorphic: true
  default_scope { order('created_at DESC') }
  scope :latest, -> { order('created_at DESC').limit(10) }
end
