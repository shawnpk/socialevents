class CommentsController < ApplicationController
  skip_after_action :verify_authorized

  def create
    @event = Event.friendly.find(params[:event_id])
    @comment = @event.comments.build(comment_params)

    if @comment.save
      flash[:notice] = 'Your comment has been added to this event.'
      redirect_to event_url(@comment.event)
    else
      flash.now[:alert] = 'There was a problem saving your comment.'
      render 'events/show'
    end
  end

  private
    def comment_params
      params.require(:comment).permit(:body)
    end
end
