class StaticController < ApplicationController
	def homepage
		if admin_types.include?(current_user.try(:type))
			o_by = params[:by] &.downcase
			o_sort =params[:sort] &.downcase

			o = if o_by == 'id' && o_sort == 'desc'
				"id DESC"
			elsif o_by == 'date' && o_sort == 'asc'
				"date ASC"
			elsif o_by == 'date' && o_sort == 'desc'
				"date DESC"
			else
				'id ASC'
			end

			@pending_approvals = Post.submitted.page(params[:page]).per(
				params[:items].then { |x| x ? x.to_i.clamp(1, 1000) : 20 }
			).order(o)

			@recent_audit_items = AuditLog.last(10)
		elsif current_user
			@pending_audit_confirmations = current_user.audit_logs
		end
	end

	def dismiss_welcome
		session[:dismiss_welcome] = Time.now.to_i
		session[:dismiss_user_id] = current_user &.id

		respond_to do |f|
			f.js
		end
	end

	def show
	end
end
