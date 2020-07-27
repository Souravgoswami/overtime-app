class AuditLogsController < ApplicationController
	before_action :authenticate_user!

	def index
		@audit_logs = AuditLog.page(params[:page]).per(params[:items] || 20).order('id ASC')
		authorize @audit_logs
	end

	def confirm_with_ajax
		@audit_log = AuditLog.find(params[:id])
		authorize @audit_log
		@audit_log.confirmed!

		respond_to do |f|
			if @audit_log.confirmed?
				f.js
			else
				f.js { render 'error_confirm_with_ajax' }
			end
		end
	end
end
