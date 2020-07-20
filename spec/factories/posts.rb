FactoryBot.define do
	factory :post1, class: 'Post' do
		date { Date.today }
		rationale { 'Some rationale' }
		user_id { User.last.id }
		overtime_request { 2.5 }
	end

	factory :post2, class: 'Post' do
		date { Date.yesterday }
		rationale { 'Some more content' }
		user_id { User.last.id }
		overtime_request { 0.5 }
	end

	factory :other_post, class: 'Post' do
		date { Date.yesterday }
		rationale { 'Some content' }
		user_id { User.last.id }
		overtime_request { 2.5 }
	end
end
