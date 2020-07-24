class StaticController < ApplicationController
	def homepage
		o_by = params[:by] &.downcase
		o_sort =params[:sort] &.downcase

		o = if o_by == 'id' && o_sort == 'desc'
			"id DESC"
		elsif o_by == 'date' && o_sort == 'asc'
			"date ASC"
		elsif o_by == 'date' && o_sort == 'desc'
			"date DESC"
		else
			'id ASC'
		end

		@pending_approvals = Post.where(status: 0)
			.page(params[:page]).per(
				params[:items].then { |x| x ? x.to_i.clamp(1, 1000) : 20 }
			).order(o)
	end

	def update_with_ajax

	end
end
