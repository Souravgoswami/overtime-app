FactoryBot.define do
	factory :post1, class: 'Post' do
		date { Date.today }
		rationale { 'Some rationale' }
		user_id { User.last.id }
	end

	factory :post2, class: 'Post' do
		date { Date.yesterday }
		rationale { 'Some more content' }
		user_id { User.last.id }
	end

	factory :other_post, class: 'Post' do
		date { Date.yesterday }
		rationale { 'Some content' }
		user_id { User.last.id }
	end
end
