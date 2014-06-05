class UserAttachment < ActiveRecord::Base
   mount_uploader :image, ImageUploader
   belongs_to :user
   validates :image, presence: true
   validates :user, presence: true
   has_many :activities, as: :trackable, dependent: :destroy
end
