class TransportsController < ApplicationController
  before_action :set_donation

  def new
    @transport = @donation.transports.new
  end

  def create
    @transport = @donation.transports.new(transport_params)

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
