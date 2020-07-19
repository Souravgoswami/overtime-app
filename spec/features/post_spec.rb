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

		it 'has a scope so that only post creators can see their posts' do
			post1 = FactoryBot.create(:post1)
			post2 = FactoryBot.create(:post1)

			other_user = User.create(email: 'other@user.mail', password: 'asdfasdf', first_name: 'Non', last_name: 'Authorized')
			other_post = Post.create(date: Date.today, rationale: "This post shouldn't be seen", user: other_user)

			visit posts_path
			expect(page).to_not have_content("This post shouldn't be seen")

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

		it 'can be created from new form page' do
			fill_in 'post[date]', with: Date.today
			fill_in 'post[rationale]', with: 'Some rationale'

			page.find('#submit', visible: false).click

			expect(page).to have_content('Some rationale')
		end

		it 'will have a cuser associated with it' do
			fill_in 'post[date]', with: Date.today
			fill_in 'post[rationale]', with: 'User Association'

			find('#submit', visible: false).click

			expect(@user.posts.last.rationale).to eq('User Association')
		end
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

		it 'can be edited' do
			visit edit_post_path(@post1)

			fill_in 'post[date]', with: Date.today
			fill_in 'post[rationale]', with: 'Edited content'

			find('#submit', visible: false).click

			expect(page).to have_content('Edited content')
		end

		it 'cannot be edited by a non-authorized user' do
			post = FactoryBot.create(:post1)
			logout(:user)

			non_authorized_user = FactoryBot.create(:non_authorized_user)
			login_as(non_authorized_user, scope: :user)

			visit edit_post_path(post)

			expect(current_path).to eq(root_path)
		end
	end
end
