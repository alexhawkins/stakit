class Stack < ActiveRecord::Base
  belongs_to :user
  has_many :stack_supplements, dependent: :destroy
  has_many :supplements, through: :stack_supplements

  default_scope { order('created_at DESC') }
  scope :visible_to, -> { where(public: true) }

end
