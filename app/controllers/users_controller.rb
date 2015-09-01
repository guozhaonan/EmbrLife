class UsersController < ApplicationController
  def show
    @user = User.find_by_username (params[:username])
  end

  private

    def user_params
        params.require(:user).permit(:first_name, :last_name, :username, :email, :college, :bio, :values, :interests, :image)
    end

end
