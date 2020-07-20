class PostPolicy < ApplicationPolicy
	def update?
		admin_types.include?(user.type) | (record.user_id.eql?(user.id) & !record.approved?)
	end
end
