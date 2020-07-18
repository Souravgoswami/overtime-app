class ApplicationController < ActionController::Base
	include Pundit
	before_action :authenticate_user!, except: [:index, :homepage]

	rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

	private

	def user_not_authorized
		flash[:alert] = 'Wow that was an invalid action!'
		redirect_to(request.referer || root_path)
	end
end
