Rails.application.routes.draw do
	root 'welcome#index'

	post 'rooms', to: 'welcome#create_rooms', as: 'create_room'
	match 'rooms/:room_name', to: 'welcome#rooms', as: 'rooms', via: [:get, :post]
	# For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
