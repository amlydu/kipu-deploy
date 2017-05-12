App.instance = App.cable.subscriptions.create "InstanceChannel",
  connected: ->
    # Called when the subscription is ready for use on the server

  disconnected: ->
    # Called when the subscription has been terminated by the server

  received: (data) ->
    $('#instance_' + data['instance_id']).html data['div']
    # Called when there's incoming data on the websocket for this channel
