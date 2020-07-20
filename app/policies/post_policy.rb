class PostPolicy < ApplicationPolicy
	def update?
		admin_types.include?(user.type) | (record.user_id.eql?(user.id) & !record.approved?)
	end

	def show?
		admin_types.include?(user.type) | (record.user_id.eql?(user.id))
	end
end
