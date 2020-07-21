class User < ApplicationRecord
	# Include default devise modules. Others available are:
	# :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
	devise :database_authenticatable, :registerable,
				 :recoverable, :rememberable, :validatable

	validates_presence_of :first_name, :last_name
	validates :phone, presence: true, length: { minimum: 10, maximum: 10 }, allow_blank: false
	validates_format_of :phone, with: /\b\d{10}\b/, multiline: false

	has_many :posts

	def full_name
		"#{last_name.upcase}, #{first_name.upcase}"
	end
end
