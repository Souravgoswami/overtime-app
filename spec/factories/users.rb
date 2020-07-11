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
end
