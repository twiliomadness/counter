class EventsController < ApplicationController

  def create
    if event = Event.create_from_twilio(params)

      twilio = Twilio::RestAccount.new(ENV['TWILIO_ID'], ENV['TWILIO_TOKEN'])

      user = User.find_by_phone_number(params[:From])
      d = {
        'From' => '6082475032',
        'To' => params[:From],
        'Body' => "Total: #{user.events.where(:thing => event.thing).sum(:number)}"
      }

      resp = account.request("/2010-04-01/Accounts/#{ENV['TWILIO_ID']}/Sms",
                             'POST', d)

      resp.error! unless resp.kind_of? Net::HTTPSuccess
      puts "code: %s\nbody: %s" % [resp.code, resp.body]
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
