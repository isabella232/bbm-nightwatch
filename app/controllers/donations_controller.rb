
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
    @donation.facebook_post_id = ::FacebookHandler.post_to_group(post_message_template.render(@donation)).to_s

    respond_to do |format|
      if @donation.save
        format.html { redirect_to @donation, notice: t('donation.accepted') }
        format.json { render :show, status: :created, location: @donation }
      else
        format.html { render :new }
        format.json { render json: @donation.errors, status: :unprocessable_entity }
      end
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
