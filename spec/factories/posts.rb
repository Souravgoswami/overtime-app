FactoryBot.define do
	factory :post1, class: 'Post' do
		date { Date.today }
		rationale { 'Some rationale' }
		# status { }
		user_id { User.last.id }
	end

	factory :post2, class: 'Post' do
		date { Date.today }
		rationale { 'Some more content' }
		# status { }
		user_id { User.last.id }
	end
end
