class AuditLog < ApplicationRecord
	belongs_to :user
	validates_presence_of :status, :start_date

	after_initialize :set_defaults
	# enum status: {  }

	private

	def set_defaults
		self.start_date ||= Date.today - 6.days
	end
end
