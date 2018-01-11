App.chat = App.cable.subscriptions.create { channel: "ChatChannel" },
	connected: ->
		console.log 'Bağlantı Sağlandı'
		# Called when the subscription is ready for use on the server

	disconnected: ->
		# Called when the subscription has been terminated by the server

	received: (data) ->
		app.messages.push(data)
		console.log "Veri Geldi"
		# Called when there's incoming data on the websocket for this channel

	speak: (message) ->
		@perform('speak', message: message)