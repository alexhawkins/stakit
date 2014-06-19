class QuestionPolicy < ApplicationPolicy
  def create?
    user.present?
  end
end