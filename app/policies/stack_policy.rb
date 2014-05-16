class StackPolicy < ApplicationPolicy
  def index?
    user.present?
  end

  def show?
    scope.where(:id => record.id).exists? && user.present? && (record.user == user || user.role?(:admin))
  end

  def create?
    index?
  end

  def new?
    index?
  end

end