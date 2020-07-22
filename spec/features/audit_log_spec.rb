describe 'AuditLog Feature' do
	before do
		@admin_user = FactoryBot.create(:user)
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
			expect(page.has_content?(/SNOW, JOHN/)).to be(true)
		end

		xit 'cannot be accessed by non-admin users' do
		end
	end
end
