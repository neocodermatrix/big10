class EventsController < ApplicationController
  def index
    #@users = User.all
    @events = Event.all
  end

  def show
    @user = current_user
    @event = Event.find(params[:id])
  end

  def new
    #@user = User.find(params[:id])
    @event = Event.new
  end

  def create
    #@user = User.find(params[:user_id])
    @event = Event.new(event_params)
    @event.users << current_user
    if @event.save
      redirect_to events_path
    else
      render :new
    end
  end

  def edit
    @event = Event.find(params[:id])
  end

  def update
    @event = Event.find(params[:id])
    if @event.update_attributes(event_params)
      redirect_to events_path
    else
      render 'edit'
    end
  end

  def destroy
    @event = Event.find(params[:id])
    @event.destroy
    redirect_to events_path
  end

  private

  def event_params
    params.require(:event).permit(:name, :description, :start_date, :end_date, :cost, :address, :city, :state, :zip, :attendees)
  end
end
