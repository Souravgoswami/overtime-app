class AuditLogsController < ApplicationController
	before_action :authenticate_user!

	def index
		@audit_logs = AuditLog.page(params[:page]).order('id ASC').per(30)
		authorize @audit_logs
	end
end
