app = new Vue({
	el: ".app",
	data: {
		messages: [],
		online_list: [],
		message: ""
	},
	methods: {
		send_message: function () {
			if (this.message.trim().length > 0)
				App.chat.speak(this.message)
			this.message = "";
		},

		get_online_list: function (list) {
			this.online_list = [];
			this.online_list = Object.keys(list.list)
			console.log("Refreshed")
		}
	}
});