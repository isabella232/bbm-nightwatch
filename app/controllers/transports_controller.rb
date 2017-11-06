class TransportsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_donation

  def new
    @transport = @donation.transports.new transporter: current_user
  end

  def create
    @transport = @donation.transports.new(transport_params)
    @transport.transporter = current_user

    if @transport.save
      redirect_to @donation
    else
      render :new
    end
  end

  private

  def set_donation
    @donation = Donation.find(params[:donation_id])

    if @donation.transports.any?
      redirect_to @donation, alert: t("transport.already_assigned")
    end
  end

  def transport_params
    params.require(:transport).permit(:name, :email, :phone)

  end
end
