class WelcomeController < ApplicationController
	layout "main"

	def create_rooms
		cookies.signed[:nick_name] = params[:nick_name]
		cookies.signed[:room_name] = params[:room_name]
		redirect_to rooms_path(room_name: params[:room_name].parameterize)
	end

	def rooms
		render 'rooms'
	end
end
