class TransportsController < ApplicationController
  before_action :authenticate_user!

  before_action :find_donation, only: [:new, :create]
  before_action :check_assignability, only: [:new, :create]

  before_action :find_transport, only: [:close, :finish, :cancel]
  before_action :check_finishability, only: [:close, :finish]
  before_action :check_cancelability, only: [:cancel]

  def new
    @transport = @donation.transports.new transporter: current_user,
                                          name: current_user.name,
                                          email: current_user.email,
                                          phone: current_user.phone
  end

  def create
    @transport = @donation.transports.new transport_params
    @transport.transporter = current_user

    if @transport.save
      @donation.assign!

      flash[:success] = t('transport.succesfully_assigned')
      redirect_to @donation
    else
      render :new
    end
  end

  def index
    @transports = current_user.transports.order(created_at: :desc).all
  end

  def close
  end

  def finish
    if @transport.update_attributes transport_params
      @transport.donation.finish!
      redirect_to transports_path
    else
      @donation = @transport.donation
      render :close
    end
  end

  def cancel
    @transport.donation.cancel!
    @transport.destroy
    redirect_to active_donations_path
  end

  private

  def find_donation
    @donation = Donation.find params[:donation_id]
  end

  def find_transport
    @transport = Transport.find params[:id]
  end

  def transport_params
    params.require(:transport).permit :name, :email, :phone, :target_location
  end

  def check_assignability
    redirect_to @donation, alert: t("transport.can_not_assign") unless @donation.can_assign?
  end

  def check_finishability
    unless @transport.transporter == current_user && @transport.donation.can_finish?
      redirect_to @transport.donation, alert: t("transport.can_not_finish")
    end
  end

  def check_cancelability
    unless @transport.transporter == current_user && @transport.donation.can_cancel?
      redirect_to @transport.donation, alert: t("transport.can_not_cancel")
    end
  end
end
