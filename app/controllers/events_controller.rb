class EventsController < ApplicationController

  def create
    if Event.create_from_twilio(params)
      head 200
    else
      raise 'meh!'
    end
  end

  def validate_twilio
    # util = Twilio::Utils.new(ENV['TWILIO_ID'], ENV['TWILIO_TOKEN'])
    # if util.validateRequest(params)
    # else
    # end
  end

end
