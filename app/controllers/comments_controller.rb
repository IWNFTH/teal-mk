class CommentsController < ApplicationController
  def create
    @comment = Comment.new(comment_params)
    @opportunity = Opportunity.find(params[:opportunity_id])
    CommentChannel.broadcast_to @opportunity, { comment: @comment, user: @comment.user } if @comment.save
  end

  private

  def comment_params
    params.require(:comment).permit(:text).merge(user_id: current_user.id, opportunity_id: params[:opportunity_id])
  end
end
