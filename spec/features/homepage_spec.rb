require 'rails_helper'

describe 'Homepage' do
	before do
		@user = FactoryBot.create(:admin_user)
		@post = FactoryBot.create(:post1)
		login_as(@user, scope: :user)

		Selenium::WebDriver::Firefox::Binary.path = '/opt/firefox-developer-edition/firefox'
	end


	it 'allows the admin to approve posts from the homepage', js: true do
		visit root_path

		choose 'post_status_approved'
		find('label.btn-outline-blue-animated').click
		expect(@post.reload.status).to eq('approved')
	end
end
