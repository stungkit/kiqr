# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(member, account, _subscription_plan)
    member ||= Member.new # guest member (not logged in)

    # By default, the user role 'member' has read-only
    # access while admin can manage everything:
    can :read, :all
    can :manage, :all if member.role?('admin')

    # Admins can't update or destroy the owner of an account
    cannot :update, Member, user_id: account.owner_id
    cannot :destroy, Member, user_id: account.owner_id

    # Define your own abilities for the passed member here.
    #
    # The first argument to `can` is the action you are giving the user
    # permission to do.
    #
    # If you pass :manage it will apply to every action. Other common actions
    # here are :read, :create, :update and :destroy.
    #
    # The second argument is the resource the user can perform the action on.
    # If you pass :all it will apply to every resource. Otherwise pass a Ruby
    # class of the resource.
    #
    # The third argument is an optional hash of conditions to further filter the
    # objects.
    # For example, here the user can only update published articles.
    #
    #   can :update, Article, :published => true
    #
    # See the wiki for details:
    # https://github.com/CanCanCommunity/cancancan/wiki/Defining-Abilities
  end
end
