class CommentChannel < ApplicationCable::Channel
  def subscribed
    @opportunity = Opportunity.find(params[:opportunity_id])
    stream_for @opportunity
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
end
