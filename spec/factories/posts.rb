FactoryBot.define do
	factory :post1, class: 'Post' do
		date { Date.today }
		rationale { 'Some rationale' }
		user_id { User.last.id }
		daily_hours { 2.5 }
	end

	factory :post2, class: 'Post' do
		date { Date.yesterday }
		rationale { 'Some more content' }
		user_id { User.last.id }
		daily_hours { 0.5 }
	end

	factory :other_post, class: 'Post' do
		date { Date.yesterday }
		rationale { 'Some content' }
		user_id { User.last.id }
		daily_hours { 2.5 }
	end
end
