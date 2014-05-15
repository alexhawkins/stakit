class SupplementPolicy < ApplicationPolicy

  def show?
    scope.where(:id => record.id).exists?
  end

  def create?
    update?
  end

  def new?
    update?
  end

  def update?
    # A user needs to be either the record's owner or the general administrator,
    # on top of being present and logged-in:
    user.present? && user.role?(:admin)
  end

end