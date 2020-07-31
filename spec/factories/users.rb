FactoryBot.define do
	factory :user, class: 'Employee' do
		email { 'test@test.com' }
		password { 'asdfasdf' }
		password_confirmation { 'asdfasdf' }
		first_name { 'John' }
		last_name { 'Snow' }
		phone { '1234567890' }
		gender { [0, 1].sample }
		ssn { 1234 }
		company { 'abc' }
	end

	factory :user2, class: 'Employee' do
		email { 'othertest@test.com' }
		password { 'asdfasdf' }
		password_confirmation { 'asdfasdf' }
		first_name { 'John' }
		last_name { 'Snow' }
		phone { '1234567890' }
		gender { [0, 1].sample }
		ssn { 1234 }
		company { 'abc' }
	end

	factory :admin_user do
		email { 'admin@test.com' }
		password { 'asdfasdf' }
		password_confirmation { 'asdfasdf' }
		first_name { 'John' }
		last_name { 'Rock' }
		phone { '1234567890' }
		gender { [0, 1].sample }
		ssn { 1234 }
		company { 'abc' }
	end

	factory :non_authorized_user, class: 'User' do
		email { 'non_authorized@test.com' }
		password { 'asdfasdf' }
		password_confirmation { 'asdfasdf' }
		first_name { 'Non' }
		last_name { 'Authorized' }
		phone { '1234567890' }
		gender { [0, 1].sample }
		ssn { 1234 }
		company { 'abc' }
	end
end
