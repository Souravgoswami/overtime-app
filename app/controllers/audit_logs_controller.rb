class AuditLogsController < ApplicationController
	before_action :authenticate_user!

	def index
		@audit_logs = AuditLog.all
		authorize @audit_logs
	end
end
