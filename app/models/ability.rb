class Ability
  include CanCan::Ability

  def initialize user
    user ||= User.new
    if user.admin?
      can :manage, :all
    else
      can :read, [User, Lesson, Category]
      can :update, User, id: user.id
      can [:read, :create, :edit, :update], Excercise, user_id: user.id
    end
  end
end
