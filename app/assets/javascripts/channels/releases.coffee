$(document).ready ->
  rel_id = $("#instance_data").data()['releaseId']

  App.releases = App.cable.subscriptions.create {
    channel: "ReleasesChannel",
    release_id: rel_id
    },
    connected: ->
      console.log("ReleasesChannel")
      # Called when the subscription is ready for use on the server

    disconnected: ->
      # Called when the subscription has been terminated by the server

    received: (data) ->
      $('#release_logs').prepend data['data']['div']
      # Called when there's incoming data on the websocket for this channel
