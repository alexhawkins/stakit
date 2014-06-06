class Supplement < ActiveRecord::Base
  has_many :stack_supplements, dependent: :destroy
  has_many :stacks, through: :stack_supplements
  
  validates :default_dose, presence: true
  validates :tooltip,
            presence: true, 
            length: {
              minimum: 10,
              maximum: 350,
              too_short: "must have at least 3 characters",
              too_long: "must have less than 350 characters",
             }

  scope :alphabetically, -> { order('name ASC') }
end
