class Event < ActiveRecord::Base
  belongs_to :user
  belongs_to :thing

  def self.create_from_twilio params
    body = params[:Body]

    event = Event.new
    split_body = body.split(' ')
    event.number = split_body.first
    event.thing = Thing.find_or_initialize_by_name(split_body[1..-1].join(' '))
    event.user = User.find_or_initialize_by_phone_number(params[:From])
    event.save!
  end

end
