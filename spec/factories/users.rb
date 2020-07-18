FactoryBot.define do
	factory :user do
		email { 'test@test.com' }
		password { 'asdfasdf' }
		password_confirmation { 'asdfasdf' }
		first_name { 'John' }
		last_name { 'Snow' }
	end

	factory :admin_user do
		email { 'admin@test.com' }
		password { 'asdfasdf' }
		password_confirmation { 'asdfasdf' }
		first_name { 'John' }
		last_name { 'Rock' }
	end

	factory :non_authorized_user, class: 'User' do
		email { 'non_authorized@test.com' }
		password { 'asdfasdf' }
		password_confirmation { 'asdfasdf' }
		first_name { 'Non' }
		last_name { 'Authorized' }
	end
end
