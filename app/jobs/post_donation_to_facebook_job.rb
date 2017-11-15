class PostDonationToFacebookJob < ApplicationJob
  queue_as :facebook

  def perform(donation_id)
    donation = Donation.find donation_id
    post_id = post_to_facebook donation
    donation.update_attributes facebook_post_id: post_id
  rescue ActiveRecord::RecordNotFound
  end

  private

  def post_to_facebook(donation)
    message = post_message_template.render donation
    link = new_donation_transport_url donation

    ::FacebookHandler.post_to_group(FACEBOOK_GROUP_ID, message, link)&.to_s
  end

  def post_message_template
    template_path = Rails.root.join("app", "views", "posts", "group_message.erb").to_s
    Tilt::ERBTemplate.new template_path
  end
end
