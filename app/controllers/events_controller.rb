class EventsController < ApplicationController
  def index
    #@users = User.all
    @events = Event.all
  end

  def show
    #@user = User.where(:user => user_id).first
    @event = Event.find(params[:id])
    @user_attending = @event.users.include?(current_user)
    #gets an array of users attending an event and it test to see if our current_user is one of them
    #@post = Post.find(params[:id])
    #binding.pry
    @post = Post.new 
    @posting = @event.posts
  end


  def new
    #@user = User.find(params[:id])
    @event = Event.new
  end

  def create
    #@users = User.find(params[:user_id])
    @event = Event.new(event_params)
    #@event.users << current_user #link the user(attendee) to the users_event table
    @event.creator = current_user #link the creator(user) to the event table
    if @event.save
      redirect_to event_path(@event)
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
      redirect_to event_path
    else
      #render 'edit'
      render :edit
    end
  end

  def destroy
    @event = Event.find(params[:id])
    @event.destroy
    redirect_to events_path
  end

  def attend
    # @event = Event.find(params[:id])
    # @event.users.push(current_user)
    # @event.save
    # redirect_to event_path
    @new_attendee = UsersEvent.new 
    @new_attendee.user_id = current_user.id 
    @new_attendee.event_id = params[:id]
    @new_attendee.save
    redirect_to event_path
  end

  def leave
    @event = UsersEvent.where({
      event_id: params[:id],
      user_id: current_user.id
      })
    @event.destroy_all
    redirect_to event_path
  end

  def is_Public?
    @event = Event.find(params[:id])
  end

  private

  def event_params
    params.require(:event).permit(:name, :description, :start_date, :end_date, :cost, :address, :city, :state, :zip, :attendees, :is_public, :image)
  end
end
