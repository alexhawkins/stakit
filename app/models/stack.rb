class Stack < ActiveRecord::Base
  belongs_to :user
  has_many :stack_supplements, dependent: :destroy
  has_many :supplements, through: :stack_supplements
  has_many :favorite_stacks, dependent: :destroy
  has_many :activities, as: :trackable, dependent: :destroy

  default_scope { order('created_at DESC') }
  scope :visible_to, -> { where(public: true) }
  scope :inactive, -> { where(default: false) }
  scope :active, -> { where(default: true) }

  #VALIDATIONS
  validates :public, presence: true
  validates :user, presence: true
  validates :name, length: {
    minimum: 3,
    maximum: 40,
    too_short: "must have at least 3 characters",
    too_long: "must have less than 40 characters",
    presence: true 
  }

end
