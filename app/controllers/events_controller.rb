class EventsController < ApplicationController
  before_action :set_event, only: [:show]
  def index
    @events = Event.all
  end

  def show
  end

  def new
    @event = Event.new
  end

  def create
    @event = Event.new(event_params)

    if @event.save
      flash[:notice] = 'Event successfully created.'
      redirect_to @event
    else
      flash.now[:alert] = 'Event not created. Please try again.'
      render :new
    end
  end

  private
    def event_params
      params.require(:event).permit(:title, :description, :start_date, :end_date, :venue, :location)
    end

    def set_event
      @event = Event.find(params[:id])
    end
end
