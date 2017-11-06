require "administrate/base_dashboard"

class TransportDashboard < Administrate::BaseDashboard
  # ATTRIBUTE_TYPES
  # a hash that describes the type of each of the model's fields.
  #
  # Each different type represents an Administrate::Field object,
  # which determines how the attribute is displayed
  # on pages throughout the dashboard.
  ATTRIBUTE_TYPES = {
    donation: Field::BelongsTo,
    transporter: Field::BelongsTo.with_options(class_name: "User"),
    id: Field::Number,
    email: Field::String,
    name: Field::String,
    target_location: Field::String,
    created_at: Field::DateTime,
    updated_at: Field::DateTime,
    phone: Field::String,
    transporter_id: Field::Number,
  }.freeze

  # COLLECTION_ATTRIBUTES
  # an array of attributes that will be displayed on the model's index page.
  #
  # By default, it's limited to four items to reduce clutter on index pages.
  # Feel free to add, remove, or rearrange items.
  COLLECTION_ATTRIBUTES = [
    :donation,
    :transporter,
    :target_location
  ].freeze

  # SHOW_PAGE_ATTRIBUTES
  # an array of attributes that will be displayed on the model's show page.
  SHOW_PAGE_ATTRIBUTES = [
    :donation,
    :id,
    :email,
    :name,
    :phone,
    :transporter,
    :target_location,
    :created_at,
    :updated_at,
  ].freeze

  # FORM_ATTRIBUTES
  # an array of attributes that will be displayed
  # on the model's form (`new` and `edit`) pages.
  FORM_ATTRIBUTES = [
    :donation,
    :name,
    :email,
    :phone,
    :transporter,
    :target_location,
  ].freeze

  # Overwrite this method to customize how transports are displayed
  # across all pages of the admin dashboard.
  #
  # def display_resource(transport)
  #   "Transport ##{transport.id}"
  # end
end
