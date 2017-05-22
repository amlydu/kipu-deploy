class ReleasesChannel < ApplicationCable::Channel
  def subscribed
    stream_from "release_#{params['release_id']}_channel"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
end
