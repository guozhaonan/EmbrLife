class SubscriptionsController < ApplicationController
  before_action :authenticate_user!

  def create
    @subscription = current_user.subscriptions.build(:idea_id => params[:idea_id])
    respond_to do |format|
      if @subscription.save
        format.html { redirect_to users_path, notice: 'Added Subscription' }
        else
        format.html { render :new }
      end
    end
  end

  def destroy
    @subscription = current_user.subscriptions.find(params[:id])
    @subscription.destroy
    respond_to do |format|
      #Fix this line (Redirects to Home but it'd be nice to redirect back to user)
      format.html { redirect_to root_path, notice: 'Subscription was successfully destroyed.' }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_friendship
      @subscription = Subscription.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def subscription_params
      params.require(:friendship).permit(:user_id, :friend_id)
    end
end
