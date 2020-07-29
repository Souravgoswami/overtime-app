namespace :notification do
	desc "Sends SMS notification to employees asking them to log whether or ot they had overtime"
	task sms: :environment do
		if Time.now.sunday?
			# 1. Schedule task to run at evern Sunday at 5:00 PM
			# 2. Iterate over all employees
			# 3. Skip admin users
			# 4. Send a message that has instructions  and a link to log time

			# User.all do |u|
			# 	# SmsTool.send_sms()
			# end

			# number: 1234567890
			# No spaces or dashes in phone number
			# Has to be exactly 10 characters
			# All characters have to be a number
		end
	end

	desc 'Sends mail notification to managers(admin users) each day to inform of pending overtime request'
	task manager_email: :environment do
		# 1. Iterate over the list of pending overtime request
		# 2. Check to see if there are any requests
		# 3. Iterate over the list of admin users / managers
		# 4. Send the email to each admin

		submitted_posts = Post.submitted
		admin_users = AdminUser.all

		if submitted_posts.count > 0
			admin_users.each do |admin|
				ManagerMailer.email(admin).deliver_now
			end
		end
	end
end
