require 'etc'
N = 100

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

def user_has_many_item_creation(user, i)
	Post.create!(
		date: Date.today,
		rationale: "User #{user.id}'s post: #{i}",
		user_id: user.id,
		overtime_request: rand(0.5..3.0).round(1)
	)

	AuditLog.create!(
		user: user,
		status: 0,
		start_date: Date.today - 6.days,
	)

	AuditLog.create!(
		user: user,
		status: 0,
		start_date: Date.today - 13.days,
	)

	AuditLog.create!(
		user: user,
		status: 0,
		start_date: Date.today - 20.days,
	)
end

def random_string(l = rand(6..12))
	l.times.map { rand(97..122).chr }.join
end

a_z = (?a..?z).to_a

a_z.each do |x|
	# ForkProcess.fork_process do
		user = AdminUser.create!(
				email: "#{x}@#{x}.#{x}",
				password: "#{x * 6}",
				first_name: random_string,
				last_name: random_string,
				phone: rand(10 ** 9..10 ** 10 - 1).to_s,
				gender: rand(2)
		)

		50.times { |i| user_has_many_item_creation(user, i) }
	# end

	print "\e[2K#{a_z.index(x)} / #{a_z.count}\r"
end

puts "Created #{a_z.length} admin users"

N.times do |n|
	# ForkProcess.fork_process do
		user = User.create!(
			email: "#{n}@x.org",
			password: "#{n.to_s.*(6)[0..5]}",
			first_name: random_string,
			last_name: random_string,
			phone: rand(10 ** 9..10 ** 10 - 1).to_s,
			gender: rand(2)
		)

		50.times { |i| user_has_many_item_creation(user, i) }
	# end

	print "\e[2K#{n} / #{N}\r"
end

puts "#{N} Users have been created!"
