class EventsController < ApplicationController
  before_action :set_event, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, except: [:index, :show]
  # before_action :authorize_owner!, only: [:edit, :udate, :destroy]

  def index
    @events = Event.order('start_date DESC' )
    @categories = Category.order(:name)
    authorize @events, :index?
  end

  def show
    authorize @event, :show?
  end

  def new
    @event = Event.new
    authorize @event, :new?
  end

  def edit
    authorize @event, :edit?
  end

  def create
    @event = Event.new(event_params)

    authorize @event, :create?

    @event.organizer = current_user

    if @event.save
      flash[:notice] = 'Event successfully created.'
      redirect_to @event
    else
      flash.now[:alert] = 'Event not created. Please try again.'
      render :new
    end
  end

  def update
    authorize @event, :update?

    if @event.update(event_params)
      flash[:notice] = 'Event successfully updated.'
      redirect_to @event
    else
      flash.now[:alert] = 'There was a problem updating the event.'
      render :edit
    end
  end

  def destroy
    authorize @event, :destroy?

    @event.destroy
    flash[:alert] = 'The event has been deleted.'
    redirect_to root_path
  end

  private
    def event_params
      params.require(:event).permit(:title, :description, :start_date, :end_date, :venue, :location, :image)
    end

    def set_event
      @event = Event.friendly.find(params[:id])

      rescue ActiveRecord::RecordNotFound
        flash[:alert] = 'The page you requested does not exist.'
        redirect_to events_url
    end

    # def authorize_owner!
    #   authenticate_user!
    #
    #   unless @event.organizer == current_user
    #     flash[:alert] = "You do not have permission to '#{action_name}' the '#{@event.title.upcase}' event."
    #     redirect_to events_url
    #   end
    # end
end
