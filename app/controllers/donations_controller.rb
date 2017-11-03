
class DonationsController < ApplicationController
  before_action :set_donation, only: [:show, :edit, :update, :destroy]

  def index
    @donations = Donation.all
  end

  def show
  end

  def new
    @donation = Donation.new
  end


  def create
    @donation = Donation.new(donation_params)
    @donation.facebook_post_id = ::FacebookHandler.post_to_group(FACEBOOK_GROUP_ID, post_message_template.render(@donation))&.to_s

    if @donation.save
      redirect_to thank_you_donations_url
    else
      render :new
    end
  end

  private

  def post_message_template
    template_path = Rails.root.join("app","views","posts","group_message.erb").to_s
    Tilt::ERBTemplate.new(template_path)
  end

  def set_donation
    @donation = Donation.find(params[:id])
  end

  def donation_params
    params.require(:donation).permit(:source_name, :source_address, :quantity, :food_type, :anonymous, :information_source)
  end
end
