class CommentsController < ApplicationController
  def create
    @comment = Comment.new(comment_params)
    @opportunity = Opportunity.find(params[:opportunity_id])
    if @comment.save
      CommentChannel.broadcast_to @opportunity, { comment: @comment, user: @comment.user }
    end
  end

  private
  def comment_params
    params.require(:comment).permit(:text).merge(user_id: current_user.id, opportunity_id: params[:opportunity_id])
  end
end
