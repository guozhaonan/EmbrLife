class UsersController < ApplicationController
  def index
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
