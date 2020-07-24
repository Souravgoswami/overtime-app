describe 'AuditLog Feature' do
	before do
		@admin_user = FactoryBot.create(:admin_user)
		login_as(@admin_user, scope: :user)
		@audit_log = FactoryBot.create(:audit_log)
	end

	# let(:audit_log) { FactoryBot.create(:audit_log) }

	describe 'index' do
		it 'has an index page that can be visited' do
			visit audit_logs_path
			expect(page.status_code).to eq(200)
		end

		it 'renders audit log content' do
			visit audit_logs_path
			expect(page.has_content?('John Rock')).to be(true)
		end

		it 'cannot be accessed by non-admin users' do
			logout(:user)
			user = FactoryBot.create(:user)
			login_as(user, scope: :user)

			visit audit_logs_path
			expect(current_path).to eq(root_path)
		end
	end
end
