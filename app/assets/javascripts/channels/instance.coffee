$(document).ready ->
  inst_id = $("#instance_data").data()['instanceId']

  App.instance = App.cable.subscriptions.create {
    channel: "InstanceChannel",
    instance_id: inst_id
    },
    connected: ->
      console.log("InstanceChannel")
      # Called when the subscription is ready for use on the server

    disconnected: ->
      # Called when the subscription has been terminated by the server

    received: (data) ->
      $('#instance_' + data['data']['instance_id']).html data['data']['div']
      # Called when there's incoming data on the websocket for this channel
