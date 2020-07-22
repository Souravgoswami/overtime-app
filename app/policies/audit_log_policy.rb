class AuditLogPolicy < ApplicationPolicy
	def index?
		admin_types.include?(user.type)
	end
end
