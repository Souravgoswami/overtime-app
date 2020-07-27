require 'rails_helper'

describe 'Homepage' do
	before do
		@user = FactoryBot.create(:admin_user)
		@post = FactoryBot.create(:post1)
		login_as(@user, scope: :user)

		Selenium::WebDriver::Firefox::Binary.path = '/opt/firefox-developer-edition/firefox'
	end


	xit 'allows the admin to approve posts from the homepage', js: true do
		visit root_path

		choose 'post_status_approved'
		find('label.btn-outline-blue-animated').click
		expect(@post.reload.status).to eq('approved')
	end

	it 'allows the employee to change the audit log status from the home page', js: true do
		logout(:user)

		user = FactoryBot.create(:user)
		login_as(user, scope: :user)
		audit_log = FactoryBot.create(:audit_log)

		visit root_path
		click_on 'confirm_1'

		page.accept_confirm
		page.accept_confirm rescue nil

		expect(audit_log.reload.status).to eq('confirmed')
	end
end
