class LikesController < ApplicationController
  before_action     :authenticate_user!
  skip_after_action :verify_authorized

  def create
    @event = Event.friendly.find(params[:event_id])
    @like = @event.likes.where(like: params[:like], user_id: current_user).create

    if @like.valid?
      flash[:notice] = "You #{params[:like]}d this event."
    else
      flash[:alert] = 'You can only like or dislike an event once.'
    end
    
    redirect_to @event
  end
end
