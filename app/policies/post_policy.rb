class PostPolicy < ApplicationPolicy
	def update?
		admin_types.include?(user.type) | (record.user_id.eql?(user.id) & !record.approved?)
	end

	def show?
		admin_types.include?(user.type) | (record.user_id.eql?(user.id))
	end

	def delete?
		admin_types.include?(user.type) | (record.user_id.eql?(user.id) & !record.approved?)
	end

	def update_with_ajax?
		admin_types.include?(user.type)
	end

	def destroy_with_ajax?
		admin_types.include?(user.type)
	end
end
