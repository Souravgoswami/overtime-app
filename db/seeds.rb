N = 100
N.times do |n|
	user = User.create!(
		email: "#{n}@x.org",
		password: "#{n.to_s.*(6)[0..5]}",
		first_name: n.to_s, last_name: n.to_s

	)

	Post.create!(
		date: Date.today,
		rationale: "#{n}",
		user_id: user.id
	)

	print "\e[2K#{n} / #{N}\r"
end

puts "100 posts have been created!"
