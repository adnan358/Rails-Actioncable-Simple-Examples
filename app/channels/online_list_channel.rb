class OnlineListChannel < ApplicationCable::Channel
	def subscribed
		stream_from ("chat_#{room_name}_list")
	end

	def unsubscribed
	# Any cleanup needed when channel is unsubscribed
	end
end
