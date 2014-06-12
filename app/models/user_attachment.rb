class UserAttachment < ActiveRecord::Base
   mount_uploader :image, ImageUploader
   belongs_to :user
   validates :image, presence: true
   validates :user, presence: true
   has_many :activities, as: :trackable, dependent: :destroy

   validate :validate_file_name_is_unique

  private

  def validate_file_name_is_unique
      if UserAttachment.where(:image => image.file.original_filename).count > 0
           errors.add :image, "'#{image.file.original_filename}' already exists"
      end
  end

end
