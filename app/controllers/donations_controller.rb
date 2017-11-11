class DonationsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_donation, only: [:show, :edit, :update, :destroy]

  def index
    @donations = Donation.order(available_from: :desc).all
  end

  def show
  end

  def new
    last_donation = current_user.donations.last
    @donation = current_user.donations.new contact_name: current_user.name,
                                           contact_phone: current_user.phone,
                                           source_name: last_donation&.source_name,
                                           source_address: last_donation&.source_address,
                                           available_from: Time.current,
                                           available_to: 2.hours.from_now
  end

  def create
    @donation = current_user.donations.new donation_params

    if @donation.save
      post_to_facebook if ENV["APP_SECRET"]

      redirect_to thank_you_donations_url
    else
      render :new
    end
  end

  private

  def post_to_facebook
    message = post_message_template.render @donation
    link = new_donation_transport_url @donation, host: ENV["HOST"]
    facebook_post_id = ::FacebookHandler.post_to_group(FACEBOOK_GROUP_ID, message, link)&.to_s
    @donation.update_attributes facebook_post_id: facebook_post_id
  end

  def post_message_template
    template_path = Rails.root.join("app", "views", "posts", "group_message.erb").to_s
    Tilt::ERBTemplate.new template_path
  end

  def set_donation
    @donation = Donation.find params[:id]
  end

  def donation_params
    params.require(:donation).permit(
      :contact_name, :contact_phone,
      :source_name, :source_address,
      :food_type, :quantity,
      :available_from, :available_to,
      :comment, :anonymous,
      :not_perishable, :packaged
    )
  end
end
