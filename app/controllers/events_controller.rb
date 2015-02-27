class EventsController < ApplicationController
  before_action :set_event, only: [:show, :edit, :update]
  before_action :find_and_set_company


  def index
    @events = @company.events
  end

  def show
  end

  def new
    @event = Event.new
    @company = Company.find(params[:company_id])
  end

  def create
    @company = Company.find(params[:company_id])
    @event = @company.events.new(event_params)
    if @event.save
      flash[:notice] = "Event was created"
      redirect_to company_events_path
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @event.update(event_params)
      flash[:notice] = "Event was updated"
      redirect_to events_path
    else
      render :edit
    end
  end

  def destroy
    event = Event.find(params[:id])
    event.destroy
    flash[:notice] = "Event done"
    redirect_to events_path
  end

  private

  def event_params
    params.require(:event).permit(:name, :date, :company_id)
  end

  def set_event
    @event = Event.find(params[:company_id])
  end

  def find_and_set_company
    @company = Company.find(params[:company_id])
  end
end
