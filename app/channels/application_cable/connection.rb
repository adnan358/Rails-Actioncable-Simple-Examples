module ApplicationCable
	class Connection < ActionCable::Connection::Base
		identified_by :current_user
		identified_by :room_name
		identified_by :online_list
		identified_by :redis_key

		def connect
			if !get_room_name.nil?
				self.current_user = get_nickname
				self.room_name = get_room_name
				self.online_list = Array.new()
				self.redis_key = redis_key
			end
		end

		private

		def get_nickname
			if user = cookies.signed["nick_name"]
				user
			else
				reject_unauthorized_connection
			end	
		end

		def get_room_name
			if room_name = cookies.signed["room_name"]
				room_name.parameterize
			else
				nil
			end
		end

		def redis_key
			"chat_#{self.room_name}"
		end
	end
end
