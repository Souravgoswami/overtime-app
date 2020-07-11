class PostsController < ApplicationController
	before_action :set_post, only: [:show, :edit, :update]
	def index
		@posts = Post.all
		@table_class = %w(primary success warning danger info)
			.each { |x| x.prepend('bg-') }
	end

	def new
		@post = Post.new
	end

	def edit
	end

	def update
		if @post.update(post_params)
			redirect_to @post, notice: 'Your post was updated'
		else
			render :edit
		end
	end

	def create
		@post = Post.new(post_params)
		@post.user_id = current_user.id

		if @post.save
			redirect_to @post, notice: 'Your post was created successfully'
		else
			render :new
		end
	end

	def show
	end

	private

	def post_params
		params.require(:post).permit(:date, :rationale)
	end

	def set_post
		@post = Post.find(params[:id])
	end
end
