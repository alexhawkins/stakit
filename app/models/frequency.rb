class Frequency < ActiveRecord::Base
  has_many :stack_supplements, dependent: :destroy
  #has_many :supplements, through: :stack_supplements
end
