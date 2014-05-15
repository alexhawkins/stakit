class FrequencyPolicy < ApplicationPolicy

  def show?
    user.present? && user.role?(:admin)
  end

  def edit?
    show?
  end

  def new?
    false
  end

  def destroy?
    show?
  end

  def update?
    show?
  end

  def create?
    show?
  end

end