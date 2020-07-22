module SmsTool
	begin
		account_sid = ENV.fetch('TWILIO_ACCOUNT_SID')
		auth_token = ENV.fetch('TWILIO_AUTH_TOKEN')
	rescue KeyError
		abort <<~EOF
			Do you have the .env file with the contents:
				TWILIO_ACCOUNT_SID = YOUR_ACCOUNT_SID
				TWILIO_AUTH_TOKEN = YOUR_AUTH_TOKEN
				TWILIO_PHONE_NUMBER = +0000000000
		EOF
	end

	@client = Twilio::REST::Client.new(account_sid, auth_token)

	def self.send_sms(number:, message:)
		@client.messages.create(
			from: ENV.fetch('TWILIO_PHONE_NUMBER'),
			to: "+91#{number}",
			body: "#{message}"
		)

		puts "Sending SMS..."
		puts "#{message} to #{number}"
	end
end
