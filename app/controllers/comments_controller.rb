class CommentsController < ApplicationController
  def create
    @idea = Idea.find(params[:idea_id])
    @comment = @idea.comments.create(comment_params)
    redirect_to idea_path(@idea)
  end

  private
    def comment_params
      params.require(:comment).permit(:user_id, :comment_text)
    end
end
