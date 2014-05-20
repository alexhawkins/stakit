class StackSupplementPolicy < ApplicationPolicy

  def index?
    user.present? && (record.stack.user == user || user.role?(:admin))
  end

  def show?
    user.present? && (record.stack.user = user || user.role(:admin))
  end

  def update?
    show?
  end

  def edit?
    show?
  end

  def create?
    show?
  end

  def new?
    show?
  end

  def destroy?
    show?
  end

end