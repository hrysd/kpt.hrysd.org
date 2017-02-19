class Broadcaster
  attr_reader :channel

  def initialize(channel)
    @channel = channel
  end

  def broadcast(event_name, data)
    ActionCable.server.broadcast channel, {
      event_name: event_name,
      data:       data
    }
  end
end
