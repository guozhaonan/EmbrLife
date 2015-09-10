class AdminController < ApplicationController
  before_filter :authenticate_admin!

  def manage_users
    @users = User.all
  end

  def manage_ideas
    @ideas = Idea.all
  end

end
