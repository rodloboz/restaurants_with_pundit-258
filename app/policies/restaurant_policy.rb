class RestaurantPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def show?
    true
  end

  def create?
    true
  end

  def update?
    user_is_owner_or_admin?
  end

  def destroy?
    user_is_owner_or_admin?
  end

  private

  def user_is_owner_or_admin?
    user_is_owner? || user_is_admin?
  end

  def user_is_owner?
    # record => is the instance of the model being authorized
    # user => current_user

    record.user == user
  end

  def user_is_admin?
    user.admin
  end
end
