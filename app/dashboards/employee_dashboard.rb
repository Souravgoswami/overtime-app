require "administrate/base_dashboard"

class EmployeeDashboard < Administrate::BaseDashboard
	ATTRIBUTE_TYPES = {
		posts: Field::HasMany,
		id: Field::Number.with_options(searchable: false),
		email: Field::String.with_options(searchable: true),
		password: Field::String.with_options(searchable: false),
		password_confirmation: Field::String.with_options(searchable: false),
		encrypted_password: Field::String.with_options(searchable: false),
		reset_password_token: Field::String.with_options(searchable: false),
		reset_password_sent_at: Field::DateTime.with_options(searchable: false),
		remember_created_at: Field::DateTime.with_options(searchable: false),
		first_name: Field::String.with_options(searchable: false),
		last_name: Field::String.with_options(searchable: false),
		gender: Field::Select.with_options(searchable: false, collection: %w(female male) ),
		type: Field::String.with_options(searchable: false),
		created_at: Field::DateTime.with_options(searchable: false),
		updated_at: Field::DateTime.with_options(searchable: false),
		phone: Field::String.with_options(searchable: false),
		ssn: Field::Number.with_options(searchable: true),
		company: Field::String.with_options(searchable: true),
	}.freeze

	COLLECTION_ATTRIBUTES = %i[
		posts
		email
		phone
		ssn
	].freeze

	SHOW_PAGE_ATTRIBUTES = %i[
		posts
		id
		email
		phone
		ssn
		company
		first_name
		last_name
		gender
		type
		created_at
		updated_at
	].freeze

	FORM_ATTRIBUTES = %i[
		posts
		email
		phone
		ssn
		company
		first_name
		last_name
		gender
		password
		password_confirmation
		type
	].freeze

	COLLECTION_FILTERS = {}.freeze
end
