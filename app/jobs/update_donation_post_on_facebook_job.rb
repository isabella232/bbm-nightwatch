class UpdateDonationPostOnFacebookJob < ApplicationJob
  queue_as :facebook

  def perform(donation_id)
    donation = Donation.find donation_id
    return unless donation.facebook_post_id

    update_post_on_facebook donation
  rescue ActiveRecord::RecordNotFound
  end

  private

  def update_post_on_facebook(donation)
    message = post_message_template.render donation

    ::FacebookHandler.update_a_post donation.facebook_post_id, message
  end

  def post_message_template
    template_path = Rails.root.join("app", "views", "posts", "group_message.erb").to_s
    Tilt::ERBTemplate.new template_path
  end
end
