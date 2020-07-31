class User < ApplicationRecord
	# Include default devise modules. Others available are:
	# :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
	devise :database_authenticatable, :registerable,
				 :recoverable, :rememberable, :validatable

	validates_presence_of :first_name, :last_name
	validates :gender, presence: true

	validates :ssn, presence: true, length: { minimum: 4, maximum: 4 }, allow_blank: false
	validates_numericality_of :ssn

	validates :company, presence: true

	validates :phone, presence: true, length: { minimum: 10, maximum: 10 }, allow_blank: false
	validates_format_of :phone, with: /\b\d{10}\b/, multiline: false

	enum gender: { female: 0, male: 1 }

	has_many :posts
	has_many :audit_logs
	has_many :hands_associations, class_name: 'Hand'
	has_many :hands, through: :hands_associations

	def full_name
		"#{first_name.capitalize} #{last_name.capitalize}"
	end
end
