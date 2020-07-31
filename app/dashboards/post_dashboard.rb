require "administrate/base_dashboard"

class PostDashboard < Administrate::BaseDashboard
	ATTRIBUTE_TYPES = {
		user: Field::BelongsTo.with_options(searchable: false),
		id: Field::Number.with_options(searchable: true),
		status: Field::Text.with_options(searchable: false),
		date: Field::Date.with_options(searchable: true),
		work_performed: Field::Text.with_options(searchable: true),
		created_at: Field::DateTime.with_options(searchable: false),
		updated_at: Field::DateTime.with_options(searchable: false),
	}.freeze

	COLLECTION_ATTRIBUTES = %i[
		user
		id
		status
		date
		work_performed
	].freeze

	SHOW_PAGE_ATTRIBUTES = %i[
		user
		id
		status
		date
		work_performed
		created_at
		updated_at
	].freeze

	FORM_ATTRIBUTES = %i[
		user
		date
		work_performed
	].freeze

	#   COLLECTION_FILTERS = {
	#     open: ->(resources) { resources.where(open: true) }
	#   }.freeze
	COLLECTION_FILTERS = {}.freeze
end
