class EventsController < ApplicationController
	def index
		@events = Event.all.reverse
	end

	def new
		@event = Event.new
		@default_time = Event.last.nil? ? Time.now : Event.last.time + 7.days
	end

	def create
		@event = Event.new(params[:event])
		if @event.save
			redirect_to :root, :notice => "New event created succesffully"
		else
			redirect_to :root, :notice => "Failed to create a event"
		end
	end

	def show
		@event = Event.find(params[:id])
	end
end
