100.times do |n|
	Post.create!(date: Date.today, rationale: "#{n}")
end

puts "100 posts have been created!"
