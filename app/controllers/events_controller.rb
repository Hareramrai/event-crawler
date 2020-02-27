class EventsController < ApplicationController
  before_action :set_event, only: :show

  def index
    event_list = EventFinder::EventList.new(Event.includes(:web_resource).undeleted)

    @events = event_list.call(params).page(params[:page])
  end

  def show
  end

  private

  def set_event
    @event = Event.find params[:id]
  end
end
