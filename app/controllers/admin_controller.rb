class AdminController < ApplicationController
  before_filter :authenticate_admin!

  def manage_users
  end

  def manage_posts
  end

end
