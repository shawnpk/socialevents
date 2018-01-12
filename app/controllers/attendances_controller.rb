class AttendancesController < ApplicationController
  before_action     :authenticate_user!
  skip_after_action :verify_authorized
  def create
    @event = Event.friendly.find(params[:event_id])
    @attendance = @event.attendances.where(attendee: current_user).first_or_create

    if @attendance.save
      flash[:notice] = 'You are now registered to attend this event.'
      redirect_to user_url(current_user)
    end
  end
end
