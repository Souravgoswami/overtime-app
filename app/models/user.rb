class User < ApplicationRecord
	# Include default devise modules. Others available are:
	# :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
	devise :database_authenticatable, :registerable,
				 :recoverable, :rememberable, :validatable

	validates_presence_of :first_name, :last_name
	validates :gender, presence: true
	validates :phone, presence: true, length: { minimum: 10, maximum: 10 }, allow_blank: false
	validates_format_of :phone, with: /\b\d{10}\b/, multiline: false

	enum gender: { female: 0, male: 1 }

	has_many :posts
	has_many :audit_logs

	def full_name
		"#{first_name.capitalize} #{last_name.capitalize}"
	end
end
