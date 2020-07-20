N = 10

AdminUser.create!(
		email: "a@a.a",
		password: "aaaaaa",
		first_name: 'aaaaaa', last_name: 'aaaaaa'
)

N.times do |n|
	user = User.create!(
		email: "#{n}@x.org",
		password: "#{n.to_s.*(6)[0..5]}",
		first_name: n.to_s, last_name: n.to_s
	)

	10.times do |nx|
		Post.create!(
			date: Date.today,
			rationale: "#{nx}",
			user_id: user.id,
			overtime_request: rand(0.5..3.0).round(1)
		)
	end

	print "\e[2K#{n} / #{N}\r"
end

puts "#{N} posts have been created!"
