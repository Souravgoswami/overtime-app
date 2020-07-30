# root_url = Overtime::Application.config.action_mailer.default_url_options[:host]

namespace :notification do
	desc "Sends SMS notification to employees asking them to log whether or ot they had overtime"
	task sms: :environment do
		root_url = Overtime::Application.config.action_mailer.default_url_options[:host]

		Employee.all.each do |e|
			notification_message = <<~EOF
				Hello #{e.first_name},
					Please login to the overtime management dashboard to request overtime or confirm your hours for last week.
					Visit #{root_url}
			EOF

			AuditLog.create!(user_id: e.id)

			SmsTool.send_sms(
				number: e.phone, message: notification_message
			)
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
