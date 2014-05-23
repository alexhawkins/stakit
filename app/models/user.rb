class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable
  has_many :stacks, dependent: :destroy
  has_many :user_attachments, dependent: :destroy
  accepts_nested_attributes_for :user_attachments
  mount_uploader :avatar, AvatarUploader

  def role?(base_role)
    role == base_role.to_s
  end
  
end
