class FrequencyPolicy < ApplicationPolicy

  def show?
    user.present? && user.role?(:admin)
  end

  def edit?
    show?
  end

  def new?
    show?
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