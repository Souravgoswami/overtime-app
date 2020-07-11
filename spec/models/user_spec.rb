require 'rails_helper'

RSpec.describe User, type: :model do
	describe 'creation' do
		before do
			@user = FactoryBot.create(:user)
		end

		it('can be created') do
			expect(@user).to be_valid
		end

		it('cannot be created without first name, last name') do
			@user.first_name = @user.last_name = nil
			expect(@user).to_not be_valid
		end

		describe 'custom name method' do
			it 'has full name method that combines first name and last name' do
				expect(@user.full_name).to eq('SNOW, JOHN')
			end
		end
	end
end
