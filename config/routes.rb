Rails.application.routes.draw do
	resources :audit_logs, except: %i[new edit destroy] do
		member do
			patch :confirm_with_ajax
		end
	end

	namespace :admin do
		resources :employees
		resources :admin_users
		resources :posts
		resources :users

		root to: "users#index"
	end

	resources :posts do
		member do
			put :update_with_ajax
			delete :destroy_with_ajax
		end
	end

	patch 'static/dismiss_welcome', to: 'static#dismiss_welcome', as: :dismiss_welcome_static
	resources :static

	get 'posts/:id/edit', to: 'posts#edit', as: :edit_post_path
	devise_for :users, skip: [:registrations]
	root to: 'static#homepage'
end
