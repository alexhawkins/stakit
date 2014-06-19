class Stack < ActiveRecord::Base
  belongs_to :user
  has_many :stack_supplements, dependent: :destroy
  has_many :supplements, through: :stack_supplements
  has_many :favorites, dependent: :destroy
  has_many :activities, as: :trackable, dependent: :destroy

  default_scope { order('created_at DESC') }
  scope :visible_to, -> { where(public: true) }
  scope :inactive, -> { where(default: false) }
  scope :active, -> { where(default: true) }

  #VALIDATIONS
  validates :public, inclusion: { in: [true, false], message: "%{public} is not a valid boolean." }
  validates :user, presence: true
  validates :name, 
    presence: true,
    uniqueness: { scope: :user_id, case_sensitive: false },
    length: {
    minimum: 3,
    maximum: 40,
    too_short: "must have at least 3 characters",
    too_long: "must have less than 40 characters",
    }

end
