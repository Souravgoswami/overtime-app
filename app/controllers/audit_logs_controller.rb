class AuditLogsController < ApplicationController
	before_action :authenticate_user!

	def index
		@audit_logs = AuditLog.all
	end
end
