class PostsController < ApplicationController
	before_action :set_post, only: %i[
		show edit
		update
		update_with_ajax
		destroy
		destroy_with_ajax
	]

	before_action :authenticate_user!

	def index
		@posts = Post.posts_by(current_user).page(params[:page]).per(params[:items] || 20).order('id ASC')
	end

	def new
		@post = Post.new
		authorize @post
	end

	def edit
		authorize @post
	end

	def update
		authorize @post

		if @post.update(post_params)
			redirect_to @post, notice: 'Your post was successfully updated'
		else
			render :edit
		end
	end

	def update_with_ajax
		authorize @post

		respond_to do |f|
			pps = post_params rescue nil

			if pps
				if @post.update(pps)
					f.js
				else
					f.js { render 'error_update_with_ajax' }
				end
			else
				f.js { render 'error_update_with_ajax' }
			end
		end
	end

	def destroy_with_ajax
		authorize @post

		respond_to do |f|
			if @post.delete
				f.js
			else
				f.js { render 'error_delete_with_ajax' }
			end
		end
	end

	def create
		@post = Post.new(post_params)
		@post.user_id = current_user.id

		if @post.save
			redirect_to @post, notice: 'Your post was successfully created'
		else
			render :new
		end
	end

	def show
		authorize @post
	end

	def destroy
		authorize @post

		if @post.delete
			redirect_to request.referrer, notice: 'The post was successfully deleted'
		else
			render :destroy
		end
	end

	private

	def post_params
		params.require(:post).permit(:date, :rationale, :status, :daily_hours)
	end

	def set_post
		@post = Post.find(params[:id])
	end
end
