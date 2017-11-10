class TransportsController < ApplicationController
  before_action :authenticate_user!
  before_action :find_donation
  before_action :check_assignability, only: [:new, :create]

  before_action :find_transport, only: [:close, :finish]
  before_action :check_finishability, only: [:close, :finish]

  def new
    @transport = @donation.transports.new transporter: current_user
  end

  def create
    @transport = @donation.transports.new transport_params
    @transport.transporter = current_user

    if @transport.save
      @donation.assign!

      redirect_to @donation
    else
      render :new
    end
  end

  def close
  end

  def finish
    if @transport.update_attributes transport_params
      @donation.finish!
      redirect_to @donation
    else
      render :close
    end
  end

  private

  def find_donation
    @donation = Donation.find params[:donation_id]
  end

  def find_transport
    @transport = @donation.transports.find params[:id]
  end

  def transport_params
    params.require(:transport).permit :name, :email, :phone, :target_location
  end

  def check_assignability
    redirect_to @donation, alert: t("transport.can_not_assign") unless @donation.can_assign?
  end

  def check_finishability
    unless @transport.transporter == current_user && @donation.can_finish?
      redirect_to @donation, alert: t("transport.can_not_finish")
    end
  end
end
