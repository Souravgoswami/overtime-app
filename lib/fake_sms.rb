module FakeSms
	Message = Struct.new(:number, :message)
	@messages = []

	def self.send_sms(number:, message:)
		@messages << Message.new
	end

	def self.messages
		@messages
	end
end
