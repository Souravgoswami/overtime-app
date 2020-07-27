class AuditLogPolicy < ApplicationPolicy
	def index?
		admin_types.include?(user.type)
	end

	def confirm_with_ajax?
		record.user.id == user.id
	end
end
