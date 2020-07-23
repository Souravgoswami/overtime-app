class AuditLogsController < ApplicationController
	before_action :authenticate_user!

	def index
		@audit_logs = AuditLog.page(params[:page]).per(params[:items] || 20).order('id ASC')
		authorize @audit_logs
	end
end
