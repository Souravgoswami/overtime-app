require 'rails_helper'

describe 'navigate' do
	before do
		@admin_user = FactoryBot.create(:admin_user)
		login_as(@admin_user, scope: :user)
	end

	describe 'edit' do
		before do
			@post = FactoryBot.create(:post1)
		end

		it 'has a status that can be edited on the form' do
			visit edit_post_path(@post)

			choose 'post_status_approved'

			find( '#submit', visible: false).click

			expect(@post.reload.status).to eq('approved')
		end
	end
end
