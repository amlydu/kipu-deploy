App.release_main = App.cable.subscriptions.create {
  channel: "ReleaseMainChannel",
  release_main_id: ''
  },
  connected: ->
    # Called when the subscription is ready for use on the server

  disconnected: ->
    # Called when the subscription has been terminated by the server

  received: (data) ->
    $('#release_mains').append data['data']
    # Called when there's incoming data on the websocket for this channel
