require 'rails_helper'

describe 'navigate' do
	before do
		@user = FactoryBot.create(:user)
	end

	describe 'index' do
		it 'can be reached successfully' do
			visit posts_path
			expect(page.status_code).to eq(200)
		end

		it 'has a title of Posts' do
			visit posts_path
			expect(page).to have_content(/Posts/)
		end

		it 'has a list of posts' do
			post1 = FactoryBot.create(:post1)
			post2 = FactoryBot.create(:post2)

			visit posts_path
			expect(page).to have_content(/ratinoale|content/)
		end
	end

	describe 'new' do
		it 'has a link from the homepage' do
			visit root_path
			click_link "newPostFromNav"
		end
	end

	describe 'delete' do
		it 'can be deleted' do
			post = FactoryBot.create(:post1)

			visit posts_path
			click_link("deletePostFromIndex_#{post.id}")
			expect(page.status_code).to eq(200)
		end
	end

	describe 'creation' do
		before do
			login_as(@user, scope: :user)
			visit new_post_path
		end

		it 'has a new form that can be reached' do
			expect(page.status_code).to eq(200)
		end

		it 'can be created from new form page'
			# fill_in 'post[date]', with: Date.today
			# fill_in 'post[rationale]', with: 'Some rationale'

			# page.find('#save', visible: true).click

			# expect(page).to have_content('Some rationale')
		# end

		it 'will have a user associated with it'
			# fill_in 'post[date]', with: Date.today
			# fill_in 'post[rationale]', with: 'User Association'

			# find('#save').click

			# expect(@user.posts.last.rationale).to eq('User Association')
		# end
	end

describe 'edit' do
	before do
		login_as(@user, scope: :user)
		@post1 = FactoryBot.create(:post1)
		@post2 = FactoryBot.create(:post2)
	end

	it 'can be reached by clicking edit on index page' do
		visit posts_url
		click_link "edit_#{@post1.id}"
		expect(page.status_code).to eq(200)
	end

	it 'can be edited'
		# visit edit_post_path(@post1)

		# fill_in 'post[date]', with: Date.today
		# fill_in 'post[rationale]', with: 'Edited content'

		# find('#save').click

		# expect(page).to have_content('Edited content')
	# end
end
end
