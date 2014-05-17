class Supplement < ActiveRecord::Base
  has_many :stack_supplements, dependent: :destroy
  has_many :stacks, through: :stack_supplements

  default_scope { order('name DESC') }
end
