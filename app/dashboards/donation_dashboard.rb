require "administrate/base_dashboard"

class DonationDashboard < Administrate::BaseDashboard
  # ATTRIBUTE_TYPES
  # a hash that describes the type of each of the model's fields.
  #
  # Each different type represents an Administrate::Field object,
  # which determines how the attribute is displayed
  # on pages throughout the dashboard.
  ATTRIBUTE_TYPES = {
    id: Field::Number,
    source_name: Field::String,
    source_address: Field::String,
    quantity: Field::Number,
    food_type: Field::String,
    anonymous: Field::Boolean,
    information_source: Field::String,
    status: Field::String,
    available_from: Field::DateTime,
    available_to: Field::DateTime,
    created_at: Field::DateTime,
    updated_at: Field::DateTime,
    facebook_post_id: Field::String,
  }.freeze

  # COLLECTION_ATTRIBUTES
  # an array of attributes that will be displayed on the model's index page.
  #
  # By default, it's limited to four items to reduce clutter on index pages.
  # Feel free to add, remove, or rearrange items.
  COLLECTION_ATTRIBUTES = [
    :id,
    :source_name,
    :source_address,
    :food_type,
    :quantity,
    :status,
  ].freeze

  # SHOW_PAGE_ATTRIBUTES
  # an array of attributes that will be displayed on the model's show page.
  SHOW_PAGE_ATTRIBUTES = [
    :id,
    :source_name,
    :source_address,
    :quantity,
    :food_type,
    :anonymous,
    :information_source,
    :status,
    :available_from,
    :available_to,
    :created_at,
    :updated_at,
    :facebook_post_id,
  ].freeze

  # FORM_ATTRIBUTES
  # an array of attributes that will be displayed
  # on the model's form (`new` and `edit`) pages.
  FORM_ATTRIBUTES = [
    :source_name,
    :source_address,
    :quantity,
    :food_type,
    :anonymous,
    :information_source,
    :status,
    :available_from,
    :available_to,
  ].freeze

  # Overwrite this method to customize how donations are displayed
  # across all pages of the admin dashboard.
  #
  # def display_resource(donation)
  #   "Donation ##{donation.id}"
  # end
end
