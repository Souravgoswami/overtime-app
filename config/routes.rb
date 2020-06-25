Rails.application.routes.draw do
	root to: 'static#homepage'
	resources :static
end
