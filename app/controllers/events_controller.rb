class EventsController < ApplicationController
  before_filter :find_user

  def create
    if params[:Body].match(/list/i)
      list_from_twilio
    else
      create_from_twilio
    end
  end

private

  def list_from_twilio
    events = @user.events.group_by(&:thing_id)
    ret = {}
    events.each_pair{|k,v| ret[Thing.find(k).name] = v.map(&:number).sum}
    text = ret.sort.map{|x| x.join(': ')}.join(', ')

    send_text params[:From], text
  end

  def create_from_twilio
    if event = Event.create_from_twilio(params)

      text = "Total: #{@user.events.where(:thing_id => event.thing).sum(:number)}"
      send_text params[:From], text
      head 200
    else
      raise 'meh!'
    end
  end

  def send_text to, content
      twilio = Twilio::RestAccount.new(ENV['TWILIO_ID'], ENV['TWILIO_TOKEN'])

      d = {
        'From' => '6082475032',
        'To' => to,
        'Body' => content
      }

      path = "/2010-04-01/Accounts/#{ENV['TWILIO_ID']}/SMS/Messages"
      resp = twilio.request(path, 'POST', d)

      resp.error! unless resp.kind_of? Net::HTTPSuccess
      puts "code: %s\nbody: %s" % [resp.code, resp.body]

  end

  def validate_twilio
    # util = Twilio::Utils.new(ENV['TWILIO_ID'], ENV['TWILIO_TOKEN'])
    # if util.validateRequest(params)
    # else
    # end
  end

  def find_user
    @user = User.find_by_phone_number(params[:From])
  end

end
