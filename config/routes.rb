Rails.application.routes.draw do
	#root :to => 'pokemons#index'

	resources :pokemons, only: [:index, :show], defaults: {format: :json}

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
