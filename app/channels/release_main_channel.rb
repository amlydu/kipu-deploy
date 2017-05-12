class ReleaseMainChannel < ApplicationCable::Channel
  def subscribed
    stream_from "release_main_#{params['release_main_id']}_channel"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
end
