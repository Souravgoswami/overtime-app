require 'rails_helper'

RSpec.describe User, type: :model do
	describe 'creation' do
		before do
			@user = User.create!(
				email: 'test@test.com',
				password: 'asdfasdf',
				password_confirmation: 'asdfasdf',
				first_name: 'John',
				last_name: 'Snow'
			)
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
