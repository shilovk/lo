class Ability
  include CanCan::Ability

  attr_reader :user

  def initialize(user)
    @user = user
    return guest_abilities unless user
    return admin_abilities if user.admin?

    user_abilities
  end

  def guest_abilities
    can :read, Food
  end

  def admin_abilities
    can :manage, :all
  end

  def user_abilities
    guest_abilities

    can :read, Food

    can :read, Order, user_id: user.id
    can :create, Order
    can :update, Order, user_id: user.id
  end
end
