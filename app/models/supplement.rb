class Supplement < ActiveRecord::Base
  has_many :stack_supplements, dependent: :destroy
  has_many :stacks, through: :stack_supplements
end
