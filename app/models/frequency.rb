class Frequency < ActiveRecord::Base
  has_many :stack_supplements, dependent: :destroy
  #has_many :supplements, through: :stack_supplements
  validates :value, presence: true, inclusion: { in: %w(bid tid am pm qds od), message: "%{value} is not a valid Frequency" }

  def self.to_xeditable
    ret = {}
    Frequency.all.each do |freq| 
      ret["#{freq.id}"] = "#{freq.value}"
    end
    ret.to_json
  end


end
