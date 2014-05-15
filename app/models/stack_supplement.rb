class StackSupplement < ActiveRecord::Base
  belongs_to :stack
  belongs_to :supplement
  belongs_to :frequency
end
