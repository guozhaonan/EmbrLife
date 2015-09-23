class UsersController < ApplicationController
  def index
    if user_signed_in?
      @users = User.where.not("id = ?",current_user.id).order("created_at DESC")
      @conversations = Conversation.involving(current_user).order("created_at DESC")
    end
    @users = User.all
  end

  def show
    @user = User.find_by_username(params[:username])
  end

  private

    def user_params
        params.require(:user).permit(:first_name, :last_name, :username, :email, :college, :bio, :values, :interests)
    end

end
