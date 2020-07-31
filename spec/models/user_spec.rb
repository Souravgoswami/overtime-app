require 'rails_helper'

RSpec.describe User, type: :model do
	describe 'creation' do
		before do
			@user = FactoryBot.create(:user)
		end

		it('can be created') do
			expect(@user).to be_valid
		end
	end

	describe 'validations' do
		before do
			@user = FactoryBot.create(:user)
		end

		it('cannot be created without first name, last name') do
			@user.first_name = nil
			expect(@user).to_not be_valid
		end

		it 'cannot be created without a last name' do
			@user.last_name = nil
			expect(@user).to_not be_valid
		end

		it 'cannot be created without a phone number' do
			@user.phone = nil
			expect(@user).to_not be_valid
		end

		it 'requires the phone attr to only contain integers' do
			@user.phone = '123456789a'
			expect(@user).to_not be_valid

			@user.phone = '#123456789'
			expect(@user).to_not be_valid

			@user.phone = '#1234567-89'
			expect(@user).to_not be_valid
		end

		it 'requires the phone attr to only contain 10 characters' do
			@user.phone = 10 ** 10
			expect(@user).to_not be_valid

			@user.phone = 10 ** 8
			expect(@user).to_not be_valid
		end

		it 'cannot be created wthout an ssn' do
			@user.ssn = nil
			expect(@user).to_not be_valid
		end

		it 'requires the ssn attr to only contain integers' do
			@user.ssn = '111a'
			expect(@user).to_not be_valid

			@user.ssn = 'a111'
			expect(@user).to_not be_valid

			@user.ssn = '1*11'
			expect(@user).to_not be_valid
		end

		it 'requires the ssn attr to only contain 10 characters' do
			@user.ssn = 10 ** 10
			expect(@user).to_not be_valid

			@user.ssn = 10 ** 8
			expect(@user).to_not be_valid
		end

		it 'requires a company' do
			@user.company = nil
			expect(@user).to_not be_valid
		end


		describe 'custom name method' do
			it 'has full name method that combines first name and last name' do
				expect(@user.full_name).to eq('John Snow')
			end
		end
	end

	describe 'relationship between admins and employees' do
		it 'allows for admins to be associated with multiple employees' do
			admin = FactoryBot.create(:admin_user)
			employee1 = FactoryBot.create(:user)
			employee2 = FactoryBot.create(:user2)

			Hand.create!(user_id: admin.id, hand_id: employee1.id)
			Hand.create!(user_id: admin.id, hand_id: employee2.id)

			expect(admin.hands.count).to eq(2)
		end
	end
end
