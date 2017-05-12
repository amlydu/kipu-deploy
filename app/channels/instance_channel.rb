class InstanceChannel < ApplicationCable::Channel
  def subscribed
    stream_from "instance_#{params['instance_id']}_channel"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
end
