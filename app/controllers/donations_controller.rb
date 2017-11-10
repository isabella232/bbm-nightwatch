class DonationsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_donation, only: [:show, :edit, :update, :destroy]

  def index
    @donations = Donation.order(available_from: :desc).all
  end

  def show
  end

  def new
    @donation = current_user.donations.new(available_from: Time.now, available_to: 2.hours.from_now)
  end

  def create
    @donation = current_user.donations.new(donation_params)

    if @donation.save
      post_to_facebook if ENV['APP_ID'] && ENV["APP_SECRET"]

      redirect_to thank_you_donations_url
    else
      render :new
    end
  end

  private

  def post_to_facebook
    facebook_post_id = ::FacebookHandler.post_to_group(FACEBOOK_GROUP_ID, post_message_template.render(@donation))&.to_s
    @donation.update_attributes facebook_post_id: facebook_post_id
  end

  def post_message_template
    template_path = Rails.root.join("app", "views", "posts", "group_message.erb").to_s
    Tilt::ERBTemplate.new(template_path)
  end

  def set_donation
    @donation = Donation.find(params[:id])
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
