class Ability
  include CanCan::Ability

  def initialize(current_user)
    return unless current_user.present? # additional permissions for logged in users (they can read their own posts)
    can :manage, User, user: current_user
    can :manage, Group, user: current_user
    can :manage, Establishment, user: current_user
    # return unless current_user.role == 'admin' # additional permissions for administrators
  end
end
