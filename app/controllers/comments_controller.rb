class CommentsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]

  def create
    @user = current_user
    @idea = Idea.find(params[:idea_id])
    @comment = @idea.comments.create(comment_params)
    redirect_to idea_path(@idea)
  end

  private
    def comment_params
      params.require(:comment).permit(:comment_text).merge(user_id: current_user.id)
    end
end
