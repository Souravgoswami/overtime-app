Rails.application.routes.draw do
	resources :posts
	get 'posts/:id/edit', to: 'posts#edit', as: :edit_post_path
	devise_for :users
	root to: 'static#homepage'
	resources :static
end
