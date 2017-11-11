require "administrate/base_dashboard"

class TargetLocationDashboard < Administrate::BaseDashboard
  # ATTRIBUTE_TYPES
  # a hash that describes the type of each of the model's fields.
  #
  # Each different type represents an Administrate::Field object,
  # which determines how the attribute is displayed
  # on pages throughout the dashboard.
  ATTRIBUTE_TYPES = {
    id: Field::Number,
    name: Field::String,
    address: Field::String,
    contact_name: Field::String,
    phone: Field::String,
    email: Field::String,
    category: Field::String,
    capacity: Field::Number,
    winter_capacity: Field::Number,
    comment: Field::Text,
    created_at: Field::DateTime,
    updated_at: Field::DateTime,
  }.freeze

  # COLLECTION_ATTRIBUTES
  # an array of attributes that will be displayed on the model's index page.
  #
  # By default, it's limited to four items to reduce clutter on index pages.
  # Feel free to add, remove, or rearrange items.
  COLLECTION_ATTRIBUTES = [
    :name,
    :address,
    :contact_name,
    :category,
    :capacity,
  ].freeze

  # SHOW_PAGE_ATTRIBUTES
  # an array of attributes that will be displayed on the model's show page.
  SHOW_PAGE_ATTRIBUTES = [
    :id,
    :name,
    :address,
    :contact_name,
    :phone,
    :email,
    :category,
    :capacity,
    :winter_capacity,
    :comment,
    :created_at,
    :updated_at,
  ].freeze

  # FORM_ATTRIBUTES
  # an array of attributes that will be displayed
  # on the model's form (`new` and `edit`) pages.
  FORM_ATTRIBUTES = [
    :name,
    :address,
    :contact_name,
    :phone,
    :email,
    :category,
    :capacity,
    :winter_capacity,
    :comment,
  ].freeze

  # Overwrite this method to customize how target locations are displayed
  # across all pages of the admin dashboard.
  #
  def display_resource(target_location)
    target_location.name
  end
end
