Rails.application.routes.draw do
	resources :audit_logs, except: %i[new edit destroy]

	namespace :admin do
		resources :users
		resources :admin_users
		resources :posts

		root to: "users#index"
	end

	resources :posts do
		member do
			put :update_with_ajax
			delete :destroy_with_ajax
		end
	end

	resources :static

	get 'posts/:id/edit', to: 'posts#edit', as: :edit_post_path
	devise_for :users, skip: [:registrations]
	root to: 'static#homepage'
end
