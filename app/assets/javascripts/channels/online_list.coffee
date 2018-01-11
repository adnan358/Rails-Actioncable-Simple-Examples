App.online_list = App.cable.subscriptions.create { channel: "OnlineListChannel" },
  connected: ->
  	console.log("Online List is Ready!")
    # Called when the subscription is ready for use on the server

  disconnected: ->
    # Called when the subscription has been terminated by the server

  received: (data) ->
  	app.get_online_list(data)
    # Called when there's incoming data on the websocket for this channel
