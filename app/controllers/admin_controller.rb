class AdminController < ApplicationController
  before_filter :authenticate_admin!
  skip_before_action :authenticate_user! 

  def manage_users
    @users = User.all
  end

  def manage_ideas
    @ideas = Idea.all
  end

end
