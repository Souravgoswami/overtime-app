require 'etc'
N = 250

class ForkProcess
	@@processes = []

	def self.fork_process(&block)
		while true
			unless @@processes.count { |x| IO.read("/proc/#{x}/stat").split(?\s)[2] != ?Z } > Etc.nprocessors * 6
				@@processes << fork { block === self }
				break
			else
				redo
				sleep 0.001
			end
		end
	end
end

AdminUser.create!(
		email: "a@a.a",
		password: "aaaaaa",
		first_name: 'aaaaaa', last_name: 'aaaaaa'
)

N.times do |n|
	ForkProcess.fork_process do
		user = User.create!(
			email: "#{n}@x.org",
			password: "#{n.to_s.*(6)[0..5]}",
			first_name: n.to_s, last_name: n.to_s
		)

		10.times do |nx|
			Post.create!(
				date: Date.today,
				rationale: "User #{user.id}'s post: #{nx}",
				user_id: user.id,
				overtime_request: rand(0.5..3.0).round(1)
			)
		end
	end

	print "\e[2K#{n} / #{N}\r"
end

puts "#{N} posts have been created!"
