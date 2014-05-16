class StackSupplement < ActiveRecord::Base
  belongs_to :stack
  belongs_to :supplement
  belongs_to :frequency

 #return nil if no supplement exists
 #Note that the key to getting this to work to was to pass permit :supplement_name as
 #a parameter in the stack_supplements controller

  def supplement_name
    supplement.try(:name)
  end

  def supplement_name=(name)
    self.supplement = Supplement.find_by_name(name) if name.present?
  end

end
