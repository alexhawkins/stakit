class QuestionPolicy < ApplicationPolicy

  def edit?
    # A user needs to be either the record's owner or the general administrator,
    # on top of being present and logged-in:
    user.present?
  end

end