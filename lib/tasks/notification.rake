namespace :notification do
	desc "Sends SMS notification to employees asking them to log whether or ot they had overtime"
	task sms: :environment do
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
