class Ability
   include CanCan::Ability
  
   def initialize(user)
     user ||= User.new # guest user
  
     if user.role? :Admin
       can :manage, :all
       can :publish, Ride
     elsif user.role? :Member
        can :read, [Ride]
        can :create, [Ride, Request]
        can [:edit, :update, :destroy], Ride, :user_id => user.id
        can [:show, :destroy], Request, :user_id => user.id
     end
   end
 end