class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new

    alias_action :create, :read, :update, :destroy, to: :crud

    if user.admin?
      can :manage, :all
    else
      can :crud, Evolution, {user_id: user.id}
      can :crud, StanhomeProduct
    end

  end
end
