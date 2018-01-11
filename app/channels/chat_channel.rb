class ChatChannel < ApplicationCable::Channel
	def subscribed
		if room_name.present? && current_user.present?
			stream_from ("chat_#{room_name}")

			# When user login them broadcast to group
			$redis.hset("#{redis_key}", "#{current_user}", "#{current_user}")
			liste = $redis.hgetall("#{redis_key}")
			ActionCable.server.broadcast("chat_#{room_name}_list", list: liste)
		end
	end

	def unsubscribed
		# When User logout, delete in redis
		$redis.hdel("#{redis_key}","#{current_user}")
		liste = $redis.hgetall("#{redis_key}")
		ActionCable.server.broadcast("chat_#{room_name}_list", list: liste)
	end

	def speak(data)
		ActionCable.server.broadcast("chat_#{room_name}", data: data["message"], user: current_user)
	end
end
